class AddTotalToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total, :currency
  end
end
