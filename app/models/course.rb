class Course < ActiveRecord::Base
  has_many :sections
  has_many :standards
  
  def has_standards?
  	return (self.standards.size >= 1)
  end
end
