class Task < ApplicationRecord
  belongs_to :task_list

  validates :title, presence: true

  before_create :set_default_position

  after_save :update_task_list_completion
  after_destroy :update_task_list_completion

  private

  def set_default_position
    self.position ||= task_list.tasks.maximum(:position).to_i + 1
  end

  def update_task_list_completion
    task_list.update_completion_percentage
  end
end
