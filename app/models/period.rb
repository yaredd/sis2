class Period < ActiveRecord::Base
  belongs_to :school_setup
  has_many  :schedules

  def self.current_semester
  	where("endDate > ? and startDate < ?", 1.week.ago.to_date, 1.week.ago.to_date)
  end
  
  def  self.current_period schoolId=1
    where(:school_setup_id => schoolId).where("endDate > ? and startDate < ?", 3.weeks.ago.to_date, 3.weeks.ago.to_date).where("name like 'Q%'").first.name
  end

end
