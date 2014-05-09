class SplitNameToFirstNameLastNameInUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :name
  	remove_column :users, :admin
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  end
end
