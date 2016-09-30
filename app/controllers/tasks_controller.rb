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

  def confirm_delete
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :completed_at, :completion_status)
  end #task_params

end #TasksController
