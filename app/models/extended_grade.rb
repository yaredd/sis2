class ExtendedGrade < ActiveRecord::Base
  belongs_to :grade
  belongs_to :benchMark
  validates_inclusion_of :bmGrade, :in => %w(7 6 5 4 3 2 1 NG), :allow_blank => true

end
