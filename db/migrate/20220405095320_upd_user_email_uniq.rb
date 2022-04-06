class UpdUserEmailUniq < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :email, unique: true
    change_column :users, :mobile, unique: true
  end
end
