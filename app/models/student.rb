class Student < ActiveRecord::Base
  has_many :schedules
  has_many :grades , :through => :schedules

  attr_accessible :attendance_tardy, :attendance_absent

  def fullNameGrade
    [[firstName, lastName].join(' '), grade].join(', ')
    
  end

  def fullName
    [firstName, lastName].join(' ')
    
  end

  def self.search grade, id
    if ! null_or_empty? grade and ! null_or_empty? id
      where(:grade => grade.to_i).where(:id => id.to_i)
  elsif ! null_or_empty? grade and  null_or_empty? id
      where(:grade => grade.to_i)
  elsif null_or_empty? grade and ! null_or_empty? id
      where(:id => id.to_i)
    else
      all
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
