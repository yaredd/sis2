class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  # , :registerable,:recoverable, :rememberable,, :validatable

  devise :ldap_authenticatable, :trackable

  has_and_belongs_to_many :roles
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :login

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end
end
