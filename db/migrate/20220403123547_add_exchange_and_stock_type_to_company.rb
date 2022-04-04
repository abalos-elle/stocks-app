class AddExchangeAndStockTypeToCompany < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :exchange, :string, after: :ticker
    add_column :companies, :stock_type, :string, after: :ticker
  end
end
