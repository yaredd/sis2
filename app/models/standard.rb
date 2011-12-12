class Standard < ActiveRecord::Base
  belongs_to :course
  has_many :benchMarks
end
