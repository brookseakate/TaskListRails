class TasksController < ApplicationController
  skip_before_action :require_login, only: [:welcome, :create]

  def welcome
    if !session[:user_id].blank?
      redirect_to :tasks and return
    else
      render :welcome
    end
  end

  def index
    @tasks = current_user.tasks
    @complete_tasks = @tasks.complete_tasks
    @incomplete_tasks = @tasks.incomplete_tasks
  end #index

  def show
    requested_task = Task.find(params[:id])

    if requested_task.user_id == current_user.id
      @task = current_user.tasks.find(params[:id])
    else
      redirect_to :unauth_req
    end
  end #show

  def new
    @task = current_user.tasks.new
    @task_status_options = Task.status_options
  end #new

  def create
    @task = current_user.tasks.new(task_params)
    @task_status_options = Task.status_options

    if @task.save && !@task.correct_completion_status_date
      # The correct_completion_status_date method corrects completed_at date if either A) the completed_at field is blank while completion_status is "completed"/"accepted", or B) completed_at field is not blank while completion_status is < "completed"/"accepted". Returns true if date needed correction, returns false otherwise
      redirect_to tasks_path
    else
      render :new
    end
  end #create

  def edit
    @task_status_options = Task.status_options

    requested_task = Task.find(params[:id])

    if requested_task.user_id == current_user.id
      @task = current_user.tasks.find(params[:id])
    else
      redirect_to :unauth_req and return
    end
  end #edit

  def update
    @task_status_options = Task.status_options

    requested_task = Task.find(params[:id])

    if requested_task.user_id == current_user.id
      @task = current_user.tasks.find(params[:id])
    else
      redirect_to :unauth_req and return
    end

    if @task.update(task_params) && !@task.correct_completion_status_date
      # The correct_completion_status_date method corrects completed_at date if either A) the completed_at field is blank while completion_status is "completed"/"accepted", or B) completed_at field is not blank while completion_status is < "completed"/"accepted". Returns true if date needed correction, returns false otherwise
      redirect_to tasks_path
    else
      render :edit
    end
  end #update

  def destroy
    Task.find(params[:id]).destroy
    redirect_to tasks_path
  end #destroy

  def complete
    @task = Task.find(params[:id])
    @task.update(completion_status: "completed", completed_at: DateTime.now)
    redirect_to tasks_path
  end #complete

  private

  def task_params
    params.require(:task).permit(:title, :description, :completed_at, :completion_status)
  end #task_params

end #TasksController
