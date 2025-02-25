class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects # Projects created by this user
  has_many :project_memberships, dependent: :destroy
  has_many :member_projects, through: :project_memberships, source: :project

  # Keep the site-wide role for now but we'll rely on it less
  enum :role, { user: 0, admin: 1 }

  # Projects the user has admin access to
  def admin_projects
    # Projects created by this user + projects where they're an admin member
    Project.left_joins(:project_memberships)
           .where("projects.user_id = ? OR (project_memberships.user_id = ? AND project_memberships.role = ?)",
                  id, id, ProjectMembership.roles[:admin])
           .distinct
  end
end
