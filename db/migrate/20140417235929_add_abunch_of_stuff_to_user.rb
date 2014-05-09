class AddAbunchOfStuffToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :public, :boolean, default: false
    add_column :users, :birthdate, :date
  end
end
