class ChangeDefaultWalletBalanceOfUser < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :wallet_balance, :decimal, :precision => 15, :scale => 2, default: 100.00
  end
end
