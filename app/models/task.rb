class Task < ActiveRecord::Base
  def self.status_options
    return ["defined", "deep freeze", "on deck", "blocked", "in progress", "completed", "accepted"]
  end # self.status_options
end
