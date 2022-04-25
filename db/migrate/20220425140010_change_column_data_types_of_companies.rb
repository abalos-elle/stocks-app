class ChangeColumnDataTypesOfCompanies < ActiveRecord::Migration[6.1]
  def change
    change_column :companies, :dividend_per_share, :decimal
    change_column :companies, :dividend_yield, :decimal
    change_column :companies, :forward_pe, :decimal
    change_column :companies, :ebitda, :decimal
    change_column :companies, :profit_margin, :decimal
  end
end
