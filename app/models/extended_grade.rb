class ExtendedGrade < ActiveRecord::Base
  belongs_to :grade
  belongs_to :benchMark
  validates_inclusion_of :bmGrade, :in => %w(7 6 5 4 3 2 1 7M 6M 5M 4M 3M 2M 1M INC P F NG), :allow_blank => true

end
