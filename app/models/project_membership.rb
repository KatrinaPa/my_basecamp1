class ProjectMembership < ApplicationRecord
  belongs_to :user
  belongs_to :project
  # Define roles for project members
  enum :role, { member: 0, admin: 1 }
  validates :user_id, uniqueness: { scope: :project_id }
end
