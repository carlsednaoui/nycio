class AddEndTimeToOccurrences < ActiveRecord::Migration
  def change
    add_column :occurrences, :end_time, :datetime
  end
end
