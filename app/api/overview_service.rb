require 'httparty'

class OverviewService
    include HTTParty

    base_uri "www.alphavantage.co"

    def fetch_company_overview(ticker)
        url = "/query?function=OVERVIEW&symbol=#{ticker}&apikey=
        #{Rails.application.credentials.dig(:alphavantage, :key)}"
        self.class.get(url)
    rescue Alphavantage::Error
        p 'Try again after a few minutes'
    end

    def fetch_latest_price(ticker)
        url = "/query?function=GLOBAL_QUOTE&symbol=#{ticker}&apikey=
        #{Rails.application.credentials.dig(:alphavantage, :key)}"
        self.class.get(url)
    rescue Alphavantage::Error
        p 'Try again after a few minutes'
    end
end