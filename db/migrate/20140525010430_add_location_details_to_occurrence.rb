class AddLocationDetailsToOccurrence < ActiveRecord::Migration
  def change
    add_column :occurrences, :address, :string
    add_column :occurrences, :city, :string
    add_column :occurrences, :state, :string
    add_column :occurrences, :zipcode, :string
    add_column :occurrences, :special_instructions, :text
  end
end
