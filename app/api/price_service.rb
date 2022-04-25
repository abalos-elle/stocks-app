class PriceService
    
    def self.fetch_prices(ticker)
        # PriceService.fetch_prices("PD")
        timeseries = client
            .stock(symbol: ticker)
            .timeseries(adjusted: true)
            .output["Time Series (Daily)"]
            .map {|k,v| [k, v["5. adjusted close"]]}        
    end

    def self.fetch_quote(ticker)
        # PriceService.fetch_quote("MSFT")
        quote = client.search(keywords: ticker).stocks[0].stock.quote             
    end

    def self.fetch_latest_price(ticker)
       # PriceService.fetch_latest_price("ADA")
       client.search(keywords: ticker).stocks[0].stock.quote.output["Global Quote"]["05. price"]             
    end

    def self.fetch_previous_close(ticker)
        # PriceService.fetch_previous_close("ADAL")
        client.search(keywords: ticker).stocks[0].stock.quote.output["Global Quote"]["08. previous close"]             
    end

    # AlphaVantageRB gem by StefanoMartin
    def self.client
        client ||= Alphavantage::Client.new(
            key: Rails.application.credentials.dig(:alphavantage, :key)
        )
    end

end