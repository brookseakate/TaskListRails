class AddIsCompleteBooleanToTasks < ActiveRecord::Migration
  def change
    add_column(:tasks, :is_complete, :boolean)
  end
end
