class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :code
      t.numeric :type
      t.references :user, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.numeric :quantity
      t.decimal :price, precision: 5, scale: 4

      t.timestamps
    end
  end
end
