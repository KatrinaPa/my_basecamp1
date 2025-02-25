class TaskList < ApplicationRecord
  belongs_to :project
  has_many :tasks, -> { order(position: :asc) }, dependent: :destroy

  validates :title, presence: true

  def completion_percentage
    return 0 if tasks.empty?
    (tasks.where(completed: true).count.to_f / tasks.count.to_f * 100).round
  end
end
