class UpdPrecisionPrices < ActiveRecord::Migration[6.1]
  def change
    change_column :transactions, :price, :decimal, :precision => 15, :scale => 2, default: 0.00
  end
end
