class PriceService
    def self.fetch_prices(ticker)
        # timeseries = client
        #     .stock(symbol: ticker)
        #     .timeseries(adjusted: true)
        #     .output["Time Series (Daily)"]
        #     .map {|k,v| [k, v["5. adjusted close"]]}
        prices = [["2022-04-03", 365],["2022-04-02", 350]]
        Hash[prices]
    end

    def self.fetch_quote(ticker)
        quote = client.search(keywords: ticker).stocks[0].stock.quote             
    end

    def self.client
        client ||= Alphavantage::Client.new(
            key: Rails.application.credentials.dig(:alphavantage, :key)
        )
    end

end