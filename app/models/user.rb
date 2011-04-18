class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_length_of :password, :minimum => 6
  validates_length_of :password_confirmation, :minimum => 6

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end
end
