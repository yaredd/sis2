class Student < ActiveRecord::Base
  has_many :schedules
  has_many :grades , :through => :schedules
  has_many :sections, :through => :schedules
  has_many :courses, :through => :sections

  attr_accessible :attendance_tardy, :attendance_absent, :attendance_tardy_sem2, :attendance_absent_sem2


	def current_grade_academic_standing_effort(period)
		honors = nil
		probation_count = 0
		self.grades.where(:grading_period => period || Period.current_grading_period).each do |g|
			effort = g.effort.try(:name)
			if ["Excellent", "Good"].include? effort
				if honors == nil
					honors = true
				else
					honors = honors && true
				end
			elsif ["Unacceptable"].include? effort
				probation_count += 1
				honors = false
			else
				honors = false
			end
		end
		if honors
			return "Honors"
		elsif probation_count >= 2
			return "Probation"
		else
			return "Good"
		end
	end
	
	def current_grade_academic_standing_achievement(period)
		overall_honors = nil
		overall_probation = nil
    overall_count_4 = 0
    overall_count_6_or_above = 0
    overall_count_3_or_below = 0
		flag = ""

		self.grades.where(:grading_period => period || Period.current_grading_period).includes(:standards, :extended_grades).each do |g|

			course_count_4 = 0
			course_count_6_or_above = 0
			course_count_3_or_below = 0
			course_benchMark_count = 0
			course_honors = nil
			course_probation = nil
	
			g.standards.includes(:benchMarks).each do |std|
				std_count_4 = 0
				std_count_6_or_above = 0
				std_count_3_or_below = 0
			
				std.benchMarks.each do |bm|
					bmGrade = g.extended_grades.where(:benchMark_id => bm.id).first.try(:bmGrade)
					case bmGrade
					when "4","4m"
						std_count_4 += 1
						course_honors = false
					when "6","6m","7","7m"
						std_count_6_or_above += 1
						if course_honors.nil? #first time round 
							course_honors = true
						else
							course_honors = course_honors && true
						end						
					when "5","5m"
						if course_honors.nil? #first time round 
							course_honors = true
						else
							course_honors = course_honors && true
						end
					when "INC"
						course_probation = true
            overall_probation = true
						course_honors = false
					when "3","3m","2","2m","1","1m"
						std_count_3_or_below += 1
						course_honors = false
						flag = flag + ",#{std.course.name} "
					end
				end # end of benchMark for each standard
				#tally for standard
				course_count_4 += std_count_4
				course_count_6_or_above += std_count_6_or_above
				course_count_3_or_below += std_count_3_or_below
				course_benchMark_count += std.benchMarks.count
			end #tally for course
		
			if g.standards == []
				#do nothing this is a course without standards and BM
			elsif course_honors 
				course_honors = true
				if overall_honors.nil?
					overall_honors = true
				else
					overall_honors = course_honors && overall_honors
				end
				flag = flag + " HONORS "
	    elsif overall_probation || course_probation || course_count_3_or_below >= 4
				overall_probation = true					
				overall_honors = false
				flag = flag + " PROBATION "
			else
				overall_honors = false
				flag = flag + " GOOD "
			end
      # tally overall 4 and (6 or 7) count
      overall_count_4 += course_count_4
      overall_count_6_or_above += course_count_6_or_above
      overall_count_3_or_below += course_count_3_or_below
		end # end traversing a course
		
		if overall_honors
			return "Honors"
    elsif (overall_count_4 <= overall_count_6_or_above) && ! overall_probation && overall_count_3_or_below == 0
      return "Honors"
		elsif overall_probation
			return "Monitoring"
		else
			return "Good"
		end
	end
	
	def is_MS?
		return (self.grade == '8' || self.grade == '7' || self.grade == '6')
	end
	
  def fullNameGrade
    [[firstName, lastName].join(' '), grade].join(', ')
    
  end

  def fullName
    [firstName, lastName].join(' ')
    
  end

  def self.search grade, id
    if ! grade.blank? and ! id.blank?
      where(:grade => grade.to_i).where(:id => id)
  	elsif ! grade.blank? and  id.blank?
      where(:grade => grade.to_i)
  	elsif grade.blank? and ! id.blank?
      where(:id => id)
    else
      self
    end
  end

  private

  def self.null_or_empty? str
    if str.nil?
      return true
    elsif str.empty?
      return true
    else
      return false
    end
  end

end
