#FetchCompanyPricesJob.perform_now(<company_id>)
class FetchTimeSeriesJob < ApplicationJob
    queue_as :default
  
    def perform(company_id)
      company = Company.find(company_id)
      
      ts = TimeSeriesService.new
      company.prices = ts.fetch_timeseries(company.ticker).parsed_response
      company.save!
    end
  end
  