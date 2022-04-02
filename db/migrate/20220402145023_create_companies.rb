class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :cik, null: false
      t.string :name, null: false
      t.string :ticker, null: false
      t.json :prices

      t.timestamps
    end
    add_index :companies, :cik, unique: true
    add_index :companies, :name, unique: true
    add_index :companies, :ticker, unique: true
  end
end
