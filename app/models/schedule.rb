class Schedule < ActiveRecord::Base
  belongs_to :student
  belongs_to :section
  belongs_to :teacher
  belongs_to :period
  belongs_to :block
  has_many   :grades


  scope :q1_schedules , where("period_id in (1, 5, 7, 8, 12, 14)")
  
  def self.schedule_by_grading_period p
  	if p == "Q1"
  		self.where("period_id in (1,5,7,8,12,14)")
  	elsif p == "Q2"
  		self.where("period_id in (2,5,7,9,12,14)")
  	elsif p == "Sem1"
  		self.where("period_id in (5,7,12,14)")
		elsif p == "Q3"
			self.where("period_id in (3,6,7,10,13,14)")
  	end
  end

  def self.non_advisory
    courses = Course.where("description not like '%Advisor%'")
    Schedule.find_all(courses.map { |c| c.id }.sort.uniq)
  end

end
