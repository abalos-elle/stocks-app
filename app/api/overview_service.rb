require 'httparty'

class OverviewService
    include HTTParty

    base_uri "www.alphavantage.co"

    def fetch_market_capitalization(ticker)
        url = "/query?function=OVERVIEW&symbol=#{ticker}&apikey=#{Rails.application.credentials.dig(:alphavantage, :key)}"
        self.class.get(url)
    end

    def fetch_beta(ticker)
        url = "/query?function=OVERVIEW&symbol=#{ticker}&apikey=#{Rails.application.credentials.dig(:alphavantage, :key)}"
        self.class.get(url)
    end

    def fetch_pe_ratio(ticker)
        url = "/query?function=OVERVIEW&symbol=#{ticker}&apikey=#{Rails.application.credentials.dig(:alphavantage, :key)}"
        self.class.get(url)
    end

    def fetch_eps(ticker)
        url = "/query?function=OVERVIEW&symbol=#{ticker}&apikey=#{Rails.application.credentials.dig(:alphavantage, :key)}"
        self.class.get(url)
    end

    def fetch_ex_dividend_date(ticker)
        url = "/query?function=OVERVIEW&symbol=#{ticker}&apikey=#{Rails.application.credentials.dig(:alphavantage, :key)}"
        self.class.get(url)
    end
end