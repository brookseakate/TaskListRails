class TasksController < ApplicationController

  def index
    @complete_tasks = Task.complete_tasks
    @incomplete_tasks = Task.incomplete_tasks
  end #index

  def show
    @task = Task.find(params[:id])
  end #show

  def new
    @task = Task.new
    @task_status_options = Task.status_options
  end #new

  def create
    @task = Task.new(task_params)
    @task_status_options = Task.status_options

    if @task.save && !@task.correct_completion_status_date
      # The correct_completion_status_date method corrects completed_at date if either A) the completed_at field is blank while completion_status is "completed"/"accepted", or B) completed_at field is not blank while completion_status is < "completed"/"accepted". Returns true if date needed correction, returns false otherwise
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
    @task_status_options = Task.status_options

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
