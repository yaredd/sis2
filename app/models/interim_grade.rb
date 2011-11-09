class InterimGrade < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :mark
  belongs_to :effort
  has_one :student, :through => :schedule
    
  validates_presence_of :mark_id, :on_task, :positive_attitude, :comes_prepared, :additional_learning, :attends_class, :schedule_id, :grading_period
  validates_numericality_of :mark_id, :schedule_id

  attr_accessible :mark_id, :on_task, :positive_attitude, :comes_prepared, :additional_learning, :attends_class, :comment
  
  def self.by_schedule_period p,s
    where(:schedule_id => s).where(:grading_period => p).first
  end
end
