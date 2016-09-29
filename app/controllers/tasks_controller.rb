class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end #index

  def show
    @task = Task.find(params[:id])
  end #show

  def new
    @task = Task.new
  end #new

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end #create

  private

  def task_params
    params.require(:task).permit(:title, :description, :completed_at, :completion_status)
  end #task_params

end #TasksController
