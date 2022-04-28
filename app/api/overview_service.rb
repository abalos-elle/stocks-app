require 'httparty'

class OverviewService
    include HTTParty

    base_uri "www.alphavantage.co"

    def fetch_company_overview(ticker)
        # o = OverviewService.new 
        # o.fetch_company_overview("IBM")
        url = "/query?function=OVERVIEW&symbol=#{ticker}&apikey=
        #{Rails.application.credentials.dig(:alphavantage, :key)}"
        self.class.get(url)
    rescue Alphavantage::Error
        p 'Try again after a few minutes'
    end

    def fetch_latest_price(ticker)
        # o = OverviewService.new 
        # o.fetch_latest_price("IBM")
        url = "/query?function=GLOBAL_QUOTE&symbol=#{ticker}&apikey=
        #{Rails.application.credentials.dig(:alphavantage, :key)}"
        self.class.get(url)
    rescue Alphavantage::Error
        p 'Try again after a few minutes'
    end

    def fetch_timeseries(ticker)
        # o = OverviewService.new 
        # o.fetch_timeseries("IBM")
        self.class.get("/query?function=TIME_SERIES_INTRADAY&symbol=#{ticker}&interval=5min&apikey=
            #{Rails.application.credentials.dig(:alphavantage, :key)}"
        )
    rescue Alphavantage::Error
        p 'Try again after a few minutes'
    end
end