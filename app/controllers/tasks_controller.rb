class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end #index

  def show
    @task = Task.find(params[:id])

    @task_complete = @task.is_complete == true ? "Yes" : "No"
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

  def edit
    @task = Task.find(params[:id])
  end #edit

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end #update

  def destroy
    Task.find(params[:id]).destroy

    redirect_to tasks_path
  end #destroy

  private

  def task_params
    params.require(:task).permit(:title, :description, :is_complete, :completed_at, :completion_status)
  end #task_params

end #TasksController
