class Mark < ActiveRecord::Base
  has_many :grades

  def self.warning_marks
    where(:name => ["3M", "2M", "1M", "INC", "3", "2", "1", "F"])
  end

  def self.warning_mark_ids
    select("distinct id").where(:name => ["3M", "2M", "1M", "INC", "3", "2", "1", "F"])
  end

end
