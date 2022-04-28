require 'date'

module CompaniesHelper
    def number_to_percent(number)
        ActionController::Base.helpers.number_to_percentage(number, precision: 4)
    end

    def candlestick_data
        timeseries = Hash.new
    
        @company.prices.each do |key,value|
            if key=="Time Series (5min)"
                value.each do |key2, value2|
                    timeseries[key2] = ohlc(value2)
                end                    
            end
        end 
            
        timeseries.to_a.reverse.to_h
    end

    def ohlc(values)
        open = values["1. open"].to_f
        high = values["2. high"].to_f
        low = values["3. low"].to_f
        close = values["4. close"].to_f #open + rand(-((high-low)/3)..((high-low)/2))
        [open, high, low, close]
    end

    def candlestick_options
         {
            plot_options: {
            candlestick: {
                colors: {
                upward: '#3C90EB',
                downward: '#DF7D46'
                }
            }
            }
        } 
    end    
end
