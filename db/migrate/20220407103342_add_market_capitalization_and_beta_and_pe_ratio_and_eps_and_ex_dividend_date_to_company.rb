class AddMarketCapitalizationAndBetaAndPeRatioAndEpsAndExDividendDateToCompany < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :market_capitalization, :json
    add_column :companies, :beta, :json
    add_column :companies, :pe_ratio, :json
    add_column :companies, :eps, :json
    add_column :companies, :ex_dividend_date, :json
  end
end
