class CreateOccurrences < ActiveRecord::Migration
  def change
    create_table :occurrences do |t|
      t.integer :event_id
      t.datetime :time

      t.timestamps
    end
  end
end
