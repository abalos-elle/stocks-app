class AddWalletBalanceColumnToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :wallet_balance, :decimal, :precision => 15, :scale => 2, default: 0.00
  end
end
