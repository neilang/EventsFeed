class Event < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :description
  validate :end_date_comes_after_start_date
  
  def end_date_comes_after_start_date
    if end_date < start_date
      errors.add(:end_date, "must come after start date")
    end
  end
end
