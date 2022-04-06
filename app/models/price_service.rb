class PriceService
    include HTTParty

    base_uri "www.alphavantage.co"

    def fetch_timeseries(ticker)
        # needed to be instantiated with "new"
        # dependent on the HTTParty include
        # o = PriceService.new 
        # o.fetch_timeseries("IBM")
        self.class.get("/query?function=TIME_SERIES_INTRADAY&symbol=#{ticker}&interval=5min&apikey=
            #{Rails.application.credentials.dig(:alphavantage, :key)}"
        )
    end
    
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