class Teacher < ActiveRecord::Base
  has_many :schedules
  has_many :students, :through => :schedules

  validates_presence_of :login, :firstName, :lastName, :staffId

  def fullName
    [firstName, lastName].join(' ')
  end
end
