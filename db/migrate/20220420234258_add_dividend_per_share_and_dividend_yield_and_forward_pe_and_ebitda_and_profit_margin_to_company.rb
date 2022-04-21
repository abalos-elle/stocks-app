class AddDividendPerShareAndDividendYieldAndForwardPeAndEbitdaAndProfitMarginToCompany < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :dividend_per_share, :integer
    add_column :companies, :dividend_yield, :integer
    add_column :companies, :forward_pe, :integer
    add_column :companies, :ebitda, :integer
    add_column :companies, :profit_margin, :integer
  end
end
