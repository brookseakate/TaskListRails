class RemoveIsCompleteBoolean < ActiveRecord::Migration
  def change
    remove_column(:tasks, :is_complete)
  end
end
