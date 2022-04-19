class FetchCompanyOverviewJob < ApplicationJob
  queue_as :default

  def perform(company_id)
    company = Company.find(company_id)

    os = OverviewService.new
    company.market_capitalization = os.fetch_company_overview(company.ticker).parsed_response["MarketCapitalization"]
    #company.market_capitalization = os.fetch_market_capitalization(company.ticker).parsed_response["MarketCapitalization"]
    company.beta = os.fetch_company_overview(company.ticker).parsed_response["Beta"]
    company.pe_ratio = os.fetch_company_overview(company.ticker).parsed_response["PERatio"]
    company.eps = os.fetch_company_overview(company.ticker).parsed_response["EPS"]
    company.ex_dividend_date = os.fetch_company_overview(company.ticker).parsed_response["ExDividendDate"]
    company.save!
  end
end