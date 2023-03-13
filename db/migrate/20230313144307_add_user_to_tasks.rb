class AddUserToTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :user_id, :integer, :null => false
    add_reference :tasks, :user, null: false, foreign_key: true
  end
end
