class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:admin, :trader], multiple: true)                                      ##
  ############################################################################################ 
  # Validations
  validates :first_name, :last_name, :birthday, :roles, presence: true
  
  # Include default devise modules. Others available are:
  # :lockable, :trackable
  has_many :owned_stocks, dependent: :destroy

  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :validatable, :confirmable, :timeoutable
  
  before_create :default_role 
  before_save :admin_auto_approved
  

  private
  def admin_auto_approved
    self.has_roles?(:admin) ? self.is_approved = true : self.is_approved = false
  end

  def default_role
    self.roles = [:trader]
  end
end
