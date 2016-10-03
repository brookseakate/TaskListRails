class Task < ActiveRecord::Base
  validates :title, presence: true

  def self.status_options
    return ["defined", "deep freeze", "on deck", "in progress", "blocked", "completed", "accepted"]
  end # self.status_options

  def is_complete?
    if self.completion_status == "completed" || self.completion_status == "accepted"
      return true
    else
      return false
    end
  end #is_complete?
end
