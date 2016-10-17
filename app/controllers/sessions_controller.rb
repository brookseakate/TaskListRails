class SessionsController < ApplicationController

  def index
    @user = User.find(session[:user_id]) # recalls the value set in the previous request
  end # index

  def create
    auth_hash = request.env['omniauth.auth']
    redirect to login_failure_path unless auth_hash['uid']

    @user = User.find_by(uid: auth_hash[:uid], provider: 'gitub')
    if @user.nil?
      # User doesn't match anything in the DB
      # Attempt to create a new user

      @user = User.build_from_github(auth_hash)
      render :creation_failure unless @user.save
      end

      # Save the user ID in the session
      session[:user_id] = @user.id

      redirect_to sessions_path
  end #create

end
