class InterimGrade < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :mark
  belongs_to :effort
  has_one :student, :through => :schedule
    
  validates_presence_of  :on_task, :positive_attitude, :comes_prepared,  :attends_class, :schedule_id, :grading_period
  validates_numericality_of   :schedule_id

  attr_accessible  :on_task, :positive_attitude, :comes_prepared,  :attends_class, :comment
  
  def self.by_schedule_period p,s
    where(:schedule_id => s).where(:grading_period => p).first
  end
end
