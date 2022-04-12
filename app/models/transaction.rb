class Transaction < ApplicationRecord
  self.inheritance_column = :_type_disabled
  validates :code, presence: true, uniqueness: true
  validates :type, presence: true
  validates :company_id, presence: true
  validates :user_id, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
  
  belongs_to :user
  belongs_to :company  
end
