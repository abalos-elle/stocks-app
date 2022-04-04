class PriceService
    include HTTParty

    base_uri "www.alphavantage.co"

    def latest_prices(ticker)
        #needed to be instantiated with "new"
        #dependent on the HTTParty include
        #e.g. 
        #o = PriceService.new 
        #o.latest_prices("IBM")
         self.class.get("/query?function=TIME_SERIES_INTRADAY&symbol=#{ticker}&interval=5min&apikey=844bccca7f9d2d6179a2964c6d3cebca")
    end
    
    def self.fetch_prices(ticker)
        #direct call
        #e.g.
        #PriceService.fetch_prices
        timeseries = client
            .stock(symbol: ticker)
            .timeseries(adjusted: true)
            .output["Time Series (Daily)"]
            .map {|k,v| [k, v["5. adjusted close"]]}
        #prices = [["2022-04-03", 365],["2022-04-02", 350]]
        #Hash[prices]
    end

    def self.fetch_quote(ticker)
         #direct call
        #e.g.
        #PriceService.fetch_quote
        quote = client.search(keywords: ticker).stocks[0].stock.quote             
    end

    def self.client
        client ||= Alphavantage::Client.new(
            key: Rails.application.credentials.dig(:alphavantage, :key)
        )
    end

end