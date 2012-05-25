class Course < ActiveRecord::Base
  has_many :sections, :dependent => :destroy
  has_many :schedules, :through => :sections
  has_many :teachers, :through => :schedules
  has_many :grades, :through => :schedules
  has_many :standards
  
  accepts_nested_attributes_for :sections, :reject_if => proc { |a| a[:sectionNumber].blank?}, :allow_destroy => true
  attr_accessible :sections_attributes, :description, :courseNumber, :name
  
  def has_standards?
  	return (self.standards.size >= 1)
  end
  
  def self.search name
  	if ! name.blank?
			where("name like ? or description like ?", "%#{name}%", "%#{name}%")
		end
		order(:courseNumber)
  end
  
end
