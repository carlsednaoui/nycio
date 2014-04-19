class AddGenderAndActiveAndToUser < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :active, :boolean, default: :false
  end
end
