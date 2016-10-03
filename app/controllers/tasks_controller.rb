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

    if @task.save
      if @task.is_complete? && @task.completed_at.blank?
        # if task is marked complete without a completion time, update completion time to now & allow confirmation
        @task.completed_at = DateTime.now
        render :edit
      elsif !@task.is_complete? && !@task.completed_at.blank?
        # if task is marked incomplete, but there is a completion time entered, update completion time to blank & allow confirmation
        @task.completed_at = nil
        render :edit
      else
        redirect_to tasks_path
      end
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

    if @task.update(task_params)
      if @task.is_complete? && @task.completed_at.blank?
        # if task is marked complete without a completion time, update completion time to now & allow confirmation
        @task.completed_at = DateTime.now
        render :edit
      elsif !@task.is_complete? && !@task.completed_at.blank?
        # if task is marked incomplete, but there is a completion time entered, update completion time to blank & allow confirmation
        @task.completed_at = nil
        render :edit
      else
        redirect_to tasks_path
      end
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
    redirect_to task_path(@task)
  end #complete

  private

  def task_params
    params.require(:task).permit(:title, :description, :completed_at, :completion_status)
  end #task_params

end #TasksController
