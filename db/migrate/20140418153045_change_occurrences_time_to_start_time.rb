class ChangeOccurrencesTimeToStartTime < ActiveRecord::Migration
  def up
    add_column :occurrences, :start_time, :datetime
    remove_column :occurrences, :time
  end

  def down
  	remove_column :occurrences, :start_time
  end
end
