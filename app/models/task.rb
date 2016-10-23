class Task < ActiveRecord::Base
  belongs_to :user

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

  # The correct_completion_status_date method corrects completed_at date if either A) the completed_at field is blank while completion_status is "completed"/"accepted", or B) completed_at field is not blank while completion_status is < "completed"/"accepted". Returns true if date needed correction, returns false otherwise
  def correct_completion_status_date
    if self.is_complete? && self.completed_at.blank?
      # if task is marked complete without a completion time, update completion time to now & allow confirmation
      self.completed_at = DateTime.now
      return true
    elsif !self.is_complete? && !self.completed_at.blank?
      # if task is marked incomplete, but there is a completion time entered, update completion time to blank & allow confirmation
      self.completed_at = nil
      return true
    else
      return false
    end
  end #correct_completion_status_date

end
