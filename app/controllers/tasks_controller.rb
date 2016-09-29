class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end #index

  def show
    @task = Task.find(params[:id])

  end #show
end
