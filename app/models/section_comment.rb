class SectionComment < ActiveRecord::Base
  belongs_to :section
  belongs_to :teacher
  validate :section_matches_teacher
  
  attr_accessible :comment
  
  def self.filed?(s, p)
  	#returns true if comment has already been given for this section
  	#for this period
  	sc = self.where(:section_id => s, :period => p)
		if ! sc.blank?
			return sc.first.id
		else
			return nil
		end
  end
  
  def section_matches_teacher
  	Teacher.find(self.teacher_id).sections_taught.include? Section.find(self.section_id)
  end
  
end
