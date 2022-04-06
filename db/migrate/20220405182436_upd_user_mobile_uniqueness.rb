class UpdUserMobileUniqueness < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :mobile, unique: true
  end
end
