#FetchCompanyPricesJob.perform_now(<company_id>)
class FetchCompanyPricesJob < ApplicationJob
  queue_as :default

  def perform(company_id)
    company = Company.find(company_id)
    # Needs premium account ---> company.prices = PriceService.fetch_prices(company.ticker) 

    quote = PriceService.fetch_quote(company.ticker)
    if quote != nil
      company.latest_price = quote.output["Global Quote"]["05. price"]
      company.previous_close = quote.output["Global Quote"]["08. previous close"]
      company.save!
    end    
  end
end
