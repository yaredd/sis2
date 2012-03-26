class Section < ActiveRecord::Base
  belongs_to :course
  has_many :schedules
  has_many :section_comments
end
