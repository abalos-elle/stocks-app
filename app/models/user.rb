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
  validates :password, format: { with: /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}/i, message: "Password must have at least 8 characters, one uppercase letter, one lowercase letter, one digit, and one special character." }

  # Include default devise modules. Others available are:
  # :lockable, :trackable
  has_many :owned_stocks, dependent: :destroy

  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :validatable, :confirmable, :timeoutable
  
  before_create :default_role 
  before_save :admin_auto_approved, :update_password
  

  private
  def admin_auto_approved
    self.has_roles?(:admin) ? self.is_approved = true : self.is_approved = false
  end

  def default_role
    self.roles = [:trader]
  end

  def update_password
    if self.has_roles?(:admin)
      self.encrypted_password = self.encrypted_password
    end
  end
end
