class FinalGrade < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :effort

  validates_presence_of :effort_id, :sem2final

end

