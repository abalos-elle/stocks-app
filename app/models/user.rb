class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :trackable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :validatable, :confirmable, :timeoutable
end
