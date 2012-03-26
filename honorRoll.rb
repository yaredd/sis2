#!/usr/local/rvm/rubies/ruby-1.9.2-p290/bin/ruby
honor_effort_students =[]
probation_effort_students =[]
honor_achievement_students =[]
probation_achievement_students =[]

Student.where("grade < 9").each do |s|
	if s.current_grade_academic_standing_effort == "Honors"
		honor_effort_students << s
	elsif s.current_grade_academic_standing_effort == "Monitoring"
		probation_effort_students << s 
	end
	if s.current_grade_academic_standing_achievement == "Honors"
		honor_achievement_students << s
	elsif s.current_grade_academic_standing_achievement == "Monitoring"
		probation_achievement_students << s
	end
end

f=File.open("/tmp/honorRoll.csv", 'w')
f=File.open("/tmp/honorRoll.csv", 'a')
f << "Honor Effort\n"
honor_effort_students.each do |h|
	f.puts  "#{h.fullName}, #{h.grade}\n"
end
f << "Monitoring Effort\n"
probation_effort_students.each do |h|
	f.puts "#{h.fullName}, #{h.grade}\n"
end
f<< "Honor Achievement\n"
honor_achievement_students.each do |h|
        f << "#{h.fullName}, #{h.grade}\n"
end
f << "Monitoring Achievement\n"
probation_achievement_students.each do |h|
        f << "#{h.fullName}, #{h.grade}\n"
end

f.close

