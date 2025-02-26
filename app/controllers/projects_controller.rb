class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [ :show, :edit, :update, :destroy, :manage_members, :update_member, :remove_member, :add_member ]
  before_action :authorize_member!, only: [ :show ]
  before_action :authorize_admin!, only: [ :edit, :update, :destroy, :manage_members, :update_member, :remove_member, :add_member ]

  def index
    @projects = Project.visible_to(current_user)
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      redirect_to @project, notice: "Project was successfully created."
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: "Project was successfully destroyed."
  end

  # New method to manage project members
  def manage_members
    @members = @project.members
    @project_memberships = @project.project_memberships.includes(:user)
  end

  # Add a member to a project
  def add_member
    @project = Project.find(params[:id])
    authorize_admin!

    @user = User.find_by(email: params[:email])

    if @user.nil?
      redirect_to manage_members_project_path(@project), alert: "User not found."
      return
    end

    membership = @project.project_memberships.find_or_initialize_by(user: @user)
    membership.role = params[:role] || "member"

    if membership.save
      redirect_to manage_members_project_path(@project), notice: "Member was successfully added."
    else
      redirect_to manage_members_project_path(@project), alert: "Failed to add member."
    end
  end

  # Update a member's role in a project
  def update_member
    @membership = @project.project_memberships.find_by!(user_id: params[:user_id])
    new_role = @membership.admin? ? 'member' : 'admin'

    if @membership.update(role: new_role)
      redirect_to manage_members_project_path(@project), notice: "Member role was successfully updated."
    else
      redirect_to manage_members_project_path(@project), alert: "Failed to update member role."
    end
  end

  # Remove a member from a project
  def remove_member
    @membership = @project.project_memberships.find_by!(user_id: params[:user_id])

    if @membership.destroy
      redirect_to manage_members_project_path(@project), notice: "Member was successfully removed."
    else
      redirect_to manage_members_project_path(@project), alert: "Failed to remove member."
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def authorize_admin!
    unless @project.admin?(current_user)
      redirect_to project_path(@project), alert: "You do not have admin rights for this project."
    end
  end

  def authorize_member!
    unless @project.member?(current_user)
      redirect_to projects_path, alert: "You do not have access to this project."
    end
  end
end
