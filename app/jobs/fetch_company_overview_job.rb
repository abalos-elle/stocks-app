class FetchCompanyOverviewJob < ApplicationJob
  queue_as :default

  def perform(company_id)
    company = Company.find(company_id)

    os = OverviewService.new
    company_details = os.fetch_company_overview(company.ticker).parsed_response
    quote = os.fetch_latest_price(company.ticker).parsed_response
    time_series = os.fetch_timeseries(company.ticker).parsed_response

    company.exchange = company_details["Exchange"]
    company.market_capitalization = company_details["MarketCapitalization"]
    company.beta = company_details["Beta"]
    company.pe_ratio = company_details["PERatio"]
    company.eps = company_details["EPS"]
    company.ex_dividend_date = company_details["ExDividendDate"]
    company.dividend_per_share = company_details["DividendPerShare"]
    company.dividend_yield = company_details["DividendYield"]
    company.forward_pe = company_details["ForwardPE"]
    company.ebitda = company_details["EBITDA"]
    company.profit_margin = company_details["ProfitMargin"]

    company.latest_price = quote["Global Quote"]["05. price"]
    company.previous_close = quote["Global Quote"]["08. previous close"]
    company.prices = time_series
    company.save!
  end
end
