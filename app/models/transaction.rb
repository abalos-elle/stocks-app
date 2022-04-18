class Transaction < ApplicationRecord
  self.inheritance_column = :_type_disabled
  validates :code, presence: true, uniqueness: true
  validates :type, presence: true
  validates :company_id, presence: true
  validates :user_id, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
  validates_numericality_of :quantity, only_integer: true
  validates_numericality_of :quantity, :greater_than => 0
  belongs_to :user
  belongs_to :company  
end
