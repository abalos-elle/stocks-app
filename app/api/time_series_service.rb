class TimeSeriesService
    include HTTParty

    base_uri "www.alphavantage.co"

    def fetch_timeseries(ticker)
        # o = TimeSeriesService.new 
        # o.fetch_timeseries("IBM")
        self.class.get("/query?function=TIME_SERIES_INTRADAY&symbol=#{ticker}&interval=5min&apikey=
            #{Rails.application.credentials.dig(:alphavantage, :key)}"
        )
    rescue Alphavantage::Error
    end    
end