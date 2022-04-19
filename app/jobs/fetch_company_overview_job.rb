class FetchCompanyOverviewJob < ApplicationJob
  queue_as :default

  def perform(company_id)
    company = Company.find(company_id)

    os = OverviewService.new
    company.market_capitalization = os.fetch_market_capitalization(company.ticker).parsed_response["MarketCapitalization"]
    # company.beta = os.fetch_beta
    # company.pe_ratio = os.fetch_pe_ratio
    # company.eps = os.fetch_eps
    # company.ex_dividend_date = os.fetch_ex_dividend_date
    company.save!
  end
end
