class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #  define relationship with roles
  has_and_belongs_to_many :roles

  before_save do
    self.roles.append(Role.find_by_name('Patient')) if self.roles.empty?
  end

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end
end
