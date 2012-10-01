class AddUniqueToUsers < ActiveRecord::Migration
  def change
    add_column :users, :unique, :money
  end
end
