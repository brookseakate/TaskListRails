class Task < ActiveRecord::Base
  validates :title, presence: true

  def self.status_options
    return ["defined", "deep freeze", "on deck", "in progress", "blocked", "completed", "accepted"]
  end # self.status_options


end
