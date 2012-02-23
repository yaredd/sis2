class Schedule < ActiveRecord::Base
  belongs_to :student
  belongs_to :section
  belongs_to :teacher
  belongs_to :period
  belongs_to :block
  has_many   :grades

	validates_presence_of :student_id, :teacher_id, :section_id, :period_id, :block_id
  scope :q1_schedules , where("period_id in (1, 5, 7, 8, 12, 14)")
  
  def self.search(teacher, student, course, section, block, period)
  	self.where(build_condition(teacher,student,course,section,block,period))
  end
  
  def self.by_grading_period p
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

	
	def self.build_condition(t,stu,c,sec,b,p)
		condition = ""
		if ! t.blank?
			condition += "teachers.id = #{t}"
		end
		if ! stu.blank?
			condition.empty? ? condition = "" : condition += " AND "
			condition += "students.id = #{stu}"
		end	
		if ! c.blank?
			c = c.tr('*', '%')
			condition.empty? ? condition = "" : condition += " AND "
			condition += "(courses.name like '#{c}' OR courses.description like '#{c}')"
		end
		if ! sec.blank?
			condition.empty? ? condition = "" : condition += " AND "
			condition += "sections.sectionNumber = #{sec}"
		end
		if ! b.blank?
			condition.empty? ? condition = "" : condition += " AND "
			condition += "blocks.name = '#{b}'"
		end
		if ! p.blank?
			condition.empty? ? condition = "" : condition += " AND "
			condition += "periods.name = '#{p}'"
		end
		condition
	end
end
