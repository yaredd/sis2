class Teacher < ActiveRecord::Base
  has_many :schedules
  has_many :students, :through => :schedules
  has_many :sections, :through => :schedules, :include => :course

  validates_presence_of :login, :firstName, :lastName, :staffId

  def fullName
    [firstName, lastName].join(' ')
  end
  
  def sections_taught		
	 	sec = []
  	self.schedules.by_grading_period(Period.current_grading_period).each do |s|
  		sec << s.section
  	end
  	sec.uniq
  end
  
  def teaches_course? course
  	sections_taught.include? Course.find_by_name("#{course}")
  end
end
