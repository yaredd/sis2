class Teacher < ActiveRecord::Base
  has_many :schedules
  has_many :students, :through => :schedules
  has_many :sections, :through => :schedules, :include => :course, :conditions => ['schedules.period_id in (3,5,7,10,14)']

  validates_presence_of :login, :firstName, :lastName, :staffId

  def fullName
    [firstName, lastName].join(' ')
  end
  
  def courses_taught
  	courses = []
  	self.sections.each do |s|
  		courses << s.course
  	end
  	courses.uniq
  end
  
  def teaches_course? course
  	courses_taught.include? Course.find_by_name("#{course}")
  end
end
