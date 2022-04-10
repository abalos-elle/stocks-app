class ChangeColumnTypeOfTransactionType < ActiveRecord::Migration[6.1]
  def change
    change_column :transactions, :type, :int
  end
end
