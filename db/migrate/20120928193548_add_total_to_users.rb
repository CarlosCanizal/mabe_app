class AddTotalToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total, :money
  end
end
