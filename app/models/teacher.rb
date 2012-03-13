class Teacher < ActiveRecord::Base
  has_many :schedules
  has_many :students, :through => :schedules
  has_many :sections, :through => :schedules, :include => :course

  validates_presence_of :login, :firstName, :lastName, :staffId

  def fullName
    [firstName, lastName].join(' ')
  end
  
  def courses_taught
		
		sections_taught = self.schedules.by_grading_period(Period.current_grading_period).sections
  	courses = []
  	sections_taught.each do |s|
  		courses << s.course
  	end
  	courses.uniq
  end
  
  def teaches_course? course
  	courses_taught.include? Course.find_by_name("#{course}")
  end
end
