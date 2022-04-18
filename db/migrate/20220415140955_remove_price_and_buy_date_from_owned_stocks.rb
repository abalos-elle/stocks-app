class RemovePriceAndBuyDateFromOwnedStocks < ActiveRecord::Migration[6.1]
  def change
    remove_column :owned_stocks, :price
    remove_column :owned_stocks, :buy_date
  end
end
