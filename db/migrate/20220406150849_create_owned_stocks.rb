class CreateOwnedStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :owned_stocks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.numeric :quantity
      t.decimal :price, precision: 5, scale: 2
      t.datetime :buy_date

      t.timestamps
    end
  end
end
