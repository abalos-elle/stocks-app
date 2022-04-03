class RenameStockTypeToAssetType < ActiveRecord::Migration[6.1]
  def change
    rename_column :companies, :stock_type, :asset_type
  end
end
