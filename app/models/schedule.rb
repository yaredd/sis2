class Schedule < ActiveRecord::Base
  belongs_to :student
  belongs_to :section
  belongs_to :teacher
  belongs_to :period
  belongs_to :block
  has_many   :grades

  scope :q1_schedules , where("period_id in (1, 5, 7, 8, 12, 14)")

  def self.non_advisory
    courses = Course.where("description not like '%Advisor%'")
    Schedule.find_all(courses.map { |c| c.id }.sort.uniq)
  end

end
