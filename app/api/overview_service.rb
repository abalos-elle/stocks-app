require 'httparty'

class OverviewService
    include HTTParty

    base_uri "www.alphavantage.co"

    def fetch_company_overview(ticker)
        url = "/query?function=OVERVIEW&symbol=#{ticker}&apikey=
        #{Rails.application.credentials.dig(:alphavantage, :key)}"
        self.class.get(url)
    rescue Alphavantage::Error
    end
end