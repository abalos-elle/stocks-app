class ChangeQuantityTypeInOwnedStocks < ActiveRecord::Migration[6.1]
  def change
    change_column :owned_stocks, :quantity, :integer, using: 'quantity::integer'
  end
end
