class TaskList < ApplicationRecord
  belongs_to :project
  has_many :tasks, -> { order(position: :asc) }, dependent: :destroy

  validates :title, presence: true

  def completion_percentage
    return 0 if tasks.empty?
    (tasks.where(completed: true).count.to_f / tasks.count.to_f * 100).round
  end

  def update_completion_percentage
    if tasks.count > 0
      completed = tasks.where(completed: true).count
      percentage = (completed.to_f / tasks.count * 100).round
      update_column(:completion_percentage, percentage)
    else
      update_column(:completion_percentage, 0)
    end
  end
end
