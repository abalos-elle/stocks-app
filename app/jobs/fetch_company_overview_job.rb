class FetchCompanyOverviewJob < ApplicationJob
  queue_as :default

  def perform(company_id)
    company = Company.find(company_id)

    os = OverviewService.new
    company.market_capitalization = os.fetch_company_overview(company.ticker).parsed_response["MarketCapitalization"]
    company.beta = os.fetch_company_overview(company.ticker).parsed_response["Beta"]
    company.pe_ratio = os.fetch_company_overview(company.ticker).parsed_response["PERatio"]
    company.eps = os.fetch_company_overview(company.ticker).parsed_response["EPS"]
    company.ex_dividend_date = os.fetch_company_overview(company.ticker).parsed_response["ExDividendDate"]
    company.dividend_per_share = os.fetch_company_overview(company.ticker).parsed_response["DividendPerShare"]
    company.dividend_yield = os.fetch_company_overview(company.ticker).parsed_response["DividendYield"]
    company.forward_pe = os.fetch_company_overview(company.ticker).parsed_response["ForwardPE"]
    company.ebitda = os.fetch_company_overview(company.ticker).parsed_response["EBITDA"]
    company.profit_margin = os.fetch_company_overview(company.ticker).parsed_response["ProfitMargin"]
    company.save!
  end
end
