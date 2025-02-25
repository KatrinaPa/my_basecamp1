class Project < ApplicationRecord
    belongs_to :user # Original creator of the project

    # Add memberships relationship
    has_many :project_memberships, dependent: :destroy
    has_many :members, through: :project_memberships, source: :user

    # Scope to find projects a user is a member of
    scope :visible_to, ->(user) {
      left_joins(:project_memberships)
        .where("projects.user_id = ? OR project_memberships.user_id = ?", user.id, user.id)
        .distinct
    }

    # Check if a user is a member of this project
    def member?(user)
      user_id == user.id || project_memberships.exists?(user_id: user.id)
    end

    # Check if a user is an admin of this project
    def admin?(user)
      user_id == user.id || project_memberships.exists?(user_id: user.id, role: :admin)
    end

    # Add a user to this project with a specific role
    def add_member(user, role = :member)
      project_memberships.create(user: user, role: role)
    end
end
