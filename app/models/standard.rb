class Standard < ActiveRecord::Base
  belongs_to :course
  has_many :benchMarks
  
  accepts_nested_attributes_for :benchMarks, :reject_if => proc { |a| a[:name].blank?}, :allow_destroy => true
  validates_presence_of :course_id
  
  def self.search course_id
    if ! course_id.blank?
      where(:course_id => course_id.to_i ).includes(:course).order("courses.courseNumber")
    else
    	order("course_id")
    end
  end
  
end
