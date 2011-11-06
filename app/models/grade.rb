class Grade < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :mark
  belongs_to :effort
  has_one :student, :through => :schedule

  validates_presence_of :mark_id, :schedule_id, :effort_id, :grading_period
  validates_numericality_of :mark_id, :schedule_id, :effort_id

  attr_accessible :mark_id, :effort_id

  def self.by_schedule_period p,s
    where(:schedule_id => s).where(:grading_period => p).first
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
