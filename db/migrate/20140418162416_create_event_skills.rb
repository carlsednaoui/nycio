class CreateEventSkills < ActiveRecord::Migration
  def change
    create_table :event_skills do |t|
      t.integer :event_id
      t.integer :skill_id

      t.timestamps
    end
  end
end
