class Company < ApplicationRecord
    validates :cik, presence: true
    validates :name, presence: true
    validates :ticker, presence: true, uniqueness: true

    def get_change
        (self.latest_price.nil? ? 0 : self.latest_price ) - 
            (self.previous_close.nil? ? 0 : self.previous_close)
    end

    def get_change_percent
        if self.previous_close.nil? 
            0
        else
            get_change/self.previous_close*100
        end
        
    end

    def self.get_top_5
        Company.where("latest_price is not null").select("*, ((latest_price/previous_close) - 1) as change_percent").order("change_percent desc").limit(5)
    end

    def self.get_bottom_5
        Company.where("latest_price is not null").select("*, ((latest_price/previous_close) - 1) as change_percent").order("change_percent").limit(5)
    end
  
end
