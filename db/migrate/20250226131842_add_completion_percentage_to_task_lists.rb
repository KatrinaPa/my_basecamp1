class AddCompletionPercentageToTaskLists < ActiveRecord::Migration[7.1]
  def change
    add_column :task_lists, :completion_percentage, :integer, default: 0, null: false
  end
end