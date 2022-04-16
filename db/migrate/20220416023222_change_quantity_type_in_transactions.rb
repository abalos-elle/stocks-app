class ChangeQuantityTypeInTransactions < ActiveRecord::Migration[6.1]
  def change
    change_column :transactions, :quantity, :integer, using: 'quantity::integer'
  end
end
