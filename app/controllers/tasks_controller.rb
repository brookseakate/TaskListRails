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
    @task_status_options = Task.status_options
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
    @task_status_options = Task.status_options
  end #edit

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to task_path(@task)
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
    @task.update(is_complete: true, completed_at: DateTime.now)

    redirect_to task_path(@task)
  end #complete

  private

  def task_params
    params.require(:task).permit(:title, :description, :is_complete, :completed_at, :completion_status)
  end #task_params

end #TasksController
