class Standard < ActiveRecord::Base
  belongs_to :course
  has_many :benchMarks
  
  accepts_nested_attributes_for :benchMarks, :reject_if => proc { |a| a[:name].blank?}, :allow_destroy => true
  validates_presence_of :course_id

  def self.sem1_standards  
    where(:grading_period => "Sem1")
  end

  def self.sem2_standards  
    where(:grading_period => "Sem2")
  end

  def self.search course_id, period
    if ! course_id.blank? && period.blank?
      where(:course_id => course_id.to_i ).includes(:course).order("courses.courseNumber")
    elsif course_id.blank? && ! period.blank?
      where(:grading_period => period).includes(:course).order("courses.courseNumber")
    elsif  ! course_id.blank? && ! period.blank?
      where(:course_id => course_id.to_i).where(:grading_period => period).includes(:course).order("courses.courseNumber")
    else
    	order("course_id")
    end
  end
  
end
