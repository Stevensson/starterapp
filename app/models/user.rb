class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

attr_accessor :login

# included for role_model gem. Take care not to change the order of the roles. 
# implementatin is based on a bitmask that sets an integer in one column in the users table 
include RoleModel
roles_attribute :roles_mask
roles :admin, :user
after_create :assign_default_role

# send confimration email after registration
after_create :send_welcome_email


def self.find_first_by_auth_conditions(warden_conditions)
  conditions = warden_conditions.dup
  if login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  else
    where(conditions).first
  end
end

# Send welcome email
def send_welcome_email
    RegistrationConfirmationMailer.confirm(self).deliver
  end



# private method defined to set default role of user upon account creation
private
  def assign_default_role
    self.roles = [:user]
    self.save
  end


  
### This is the correct method you override with the code above
### def self.find_for_database_authentication(warden_conditions)
### end 

# Virtual attribute for authenticating by either username or email
# This is in addition to a real persisted field like 'username'



end
