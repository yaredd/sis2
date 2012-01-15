class Course < ActiveRecord::Base
  has_many :sections
  has_many :schedules, :through => :sections
  has_many :teachers, :through => :schedules
  has_many :grades, :through => :schedules
  has_many :standards
  
  def has_standards?
  	return (self.standards.size >= 1)
  end
end
