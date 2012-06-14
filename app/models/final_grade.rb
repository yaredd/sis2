class FinalGrade < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :effort
  has_one :student, :through => :schedule
  has_one :section, :through => :schedule
  has_one :course, :through => :section
  has_many :standards, :through => :course
  has_one :teacher, :through => :schedule

  #validates_presence_of :effort_id, :sem2final

end

