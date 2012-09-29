class AddFamiliesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone1, :integer
    add_column :users, :phone2, :integer
    add_column :users, :phone3, :integer
  end
end
