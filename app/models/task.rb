class Task < ActiveRecord::Base
  validates :title, presence: true

  def self.status_options
    return ["defined", "deep freeze", "on deck", "in progress", "blocked", "completed", "accepted"]
  end # self.status_options

  def self.complete_tasks
    return self.all.select { |task| (task.completion_status == "completed" || task.completion_status == "accepted") }
  end

  def self.incomplete_tasks
    return self.all.reject { |task| (task.completion_status == "completed" || task.completion_status == "accepted") }
  end

  def is_complete?
    if self.completion_status == "completed" || self.completion_status == "accepted"
      return true
    else
      return false
    end
  end #is_complete?
end
