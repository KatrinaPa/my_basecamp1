class TaskListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :authorize_member!
  before_action :set_task_list, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_admin_for_modify!, only: [ :new, :create, :edit, :update, :destroy ]

  def index
    @task_lists = @project.task_lists
  end

  def show
    @tasks = @task_list.tasks.order(position: :asc)
    @task = Task.new(task_list: @task_list)
  end

  def new
    @task_list = @project.task_lists.new
  end

  def edit
  end

  def create
    @task_list = @project.task_lists.new(task_list_params)

    if @task_list.save
      redirect_to project_task_lists_path(@project), notice: "Task list was successfully created."
    else
      render :new
    end
  end

  def update
    if @task_list.update(task_list_params)
      redirect_to project_task_list_path(@project, @task_list), notice: "Task list was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @task_list.destroy
    redirect_to project_task_lists_path(@project), notice: "Task list was successfully deleted."
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task_list
    @task_list = @project.task_lists.find(params[:id])
  end

  def task_list_params
    params.require(:task_list).permit(:title, :description)
  end

  def authorize_member!
    unless @project.member?(current_user)
      redirect_to projects_path, alert: "You do not have access to this project."
    end
  end

  def authorize_admin_for_modify!
    unless @project.admin?(current_user)
      redirect_to project_task_lists_path(@project), alert: "You do not have admin rights for this project."
    end
  end
end
