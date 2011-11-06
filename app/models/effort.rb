class Effort < ActiveRecord::Base
  has_many :grades

  def self.warning_efforts
    where(:name => ["Mediocre", "Unacceptable"])
  end

  def self.warning_effort_ids
    select("distinct id").where(:name => ["Mediocre", "Unacceptable"])
  end

end
