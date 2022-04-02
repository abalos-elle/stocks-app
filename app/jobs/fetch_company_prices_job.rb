class FetchCompanyPricesJob < ApplicationJob
  queue_as :default

  def perform(company_id)
    company = Company.find(company_id)
    company.prices = PriceService.fetch_prices(company.ticker)
    company.save!
  end
end
