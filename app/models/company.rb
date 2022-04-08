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

    def get_top_5
        Company.order(get_change).limit(5)
    end

    def self.get_bottom_5
        Company.order("latest_price - previous_close")
    end
end
