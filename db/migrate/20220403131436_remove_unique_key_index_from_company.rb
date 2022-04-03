class RemoveUniqueKeyIndexFromCompany < ActiveRecord::Migration[6.1]
  def change
    remove_index :companies, name: :index_companies_on_name
  end
end
