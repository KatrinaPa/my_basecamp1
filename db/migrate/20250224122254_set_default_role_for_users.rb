class SetDefaultRoleForUsers < ActiveRecord::Migration[8.0]
  def up
    change_column_default :users, :role, 0
    User.where(role: nil).update_all(role: 0)
  end

  def down
    change_column_default :users, :role, nil
  end
end
