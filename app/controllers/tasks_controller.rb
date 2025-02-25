class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project_and_task_list
  before_action :authorize_member!
  before_action :set_task, only: [ :update, :destroy, :toggle ]

  def create
    @task = @task_list.tasks.new(task_params)

    if @task.save
      redirect_to project_task_list_path(@project, @task_list), notice: "Task was successfully created."
    else
      @tasks = @task_list.tasks.order(position: :asc)
      render "task_lists/show"
    end
  end

  def update
    if @task.update(task_params)
      redirect_to project_task_list_path(@project, @task_list), notice: "Task was successfully updated."
    else
      @tasks = @task_list.tasks.order(position: :asc)
      render "task_lists/show"
    end
  end

  def destroy
    @task.destroy
    redirect_to project_task_list_path(@project, @task_list), notice: "Task was successfully deleted."
  end

  def toggle
    @task.update(completed: !@task.completed)
    redirect_to project_task_list_path(@project, @task_list)
  end

  private

  def set_project_and_task_list
    @project = Project.find(params[:project_id])
    @task_list = @project.task_lists.find(params[:task_list_id])
  end

  def set_task
    @task = @task_list.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :completed, :position)
  end

  def authorize_member!
    unless @project.member?(current_user)
      redirect_to projects_path, alert: "You do not have access to this project."
    end
  end
end
