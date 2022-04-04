class Company < ApplicationRecord
    validates :cik, presence: true
    validates :name, presence: true
    validates :ticker, presence: true, uniqueness: true
end
