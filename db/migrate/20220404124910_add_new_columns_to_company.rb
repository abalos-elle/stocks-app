class AddNewColumnsToCompany < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :latest_price, :decimal, :precision => 15, :scale => 4
    add_column :companies, :previous_close, :decimal, :precision => 15, :scale => 4

  end
end
