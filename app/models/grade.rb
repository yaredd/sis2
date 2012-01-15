class Grade < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :mark
  belongs_to :effort
  has_one :student, :through => :schedule
  has_one :section, :through => :schedule
  has_one :course, :through => :section
  has_many :standards, :through => :course
  has_one :teacher, :through => :schedule
  
  has_many :extended_grades, :dependent => :destroy

  validates_presence_of  :schedule_id, :grading_period
  validates_numericality_of  :schedule_id

  accepts_nested_attributes_for :extended_grades
  attr_accessible :mark_id, :effort_id, :comment, :extended_grades_attributes

  def self.by_schedule_period p,s
    where(:schedule_id => s).where(:grading_period => p).first
  end
	
	def self.by_period p
		where(:grading_period => p)
	end

  def self.q1_grades
    where(:grading_period => "Q1")
  end

  def self.student_grades student_id
    q1_grades.joins(:schedule).joins(:student).merge(Student.find(student_id))
  end

  def self.warning_grades
    where("mark_id in (?) or effort_id in (?)", Mark.warning_mark_ids, Effort.warning_effort_ids)
  end
end
