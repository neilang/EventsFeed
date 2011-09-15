class Event < ActiveRecord::Base
  
  default_scope :order => "start_date ASC"
  
  validates_presence_of :title
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :notes
  validate :end_date_comes_after_start_date
  
  def end_date_comes_after_start_date
    if end_date < start_date
      errors.add(:end_date, "must come after start date")
    end
  end
  
  def friendly_start_date
    start_date.strftime("%d/%m/%Y")
  end
  
  def friendly_end_date
    end_date.strftime("%d/%m/%Y")
  end
  
  # To make things easier when working with NSDate, time is in a simpler format
  def startdate
    start_date.strftime("%Y-%m-%d %H:%M");
  end
  
  def enddate
    end_date.strftime("%Y-%m-%d %H:%M");
  end
end
