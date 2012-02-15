class Period < ActiveRecord::Base
  belongs_to :school_setup
  has_many  :schedules

  def self.current_semester
  	where("endDate > ? and startDate < ?", 6.weeks.ago.to_date, 6.weeks.ago.to_date).where("name like 'Sem%'").first.name.titleize
  end
  
  def  self.current_period
    where("endDate > ? and startDate < ?", 6.weeks.ago.to_date, 6.weeks.ago.to_date).where("name like 'Q%'").first.name
  end
  
  def self.current_grading_period
  	# Grading periods are either Q1, Sem1, Q3 or Sem2
  	if self.current_period == 'Q2' || self.current_period == 'Q4'
  		self.current_semester
  	else
  		self.current_period
  	end
  end

end
