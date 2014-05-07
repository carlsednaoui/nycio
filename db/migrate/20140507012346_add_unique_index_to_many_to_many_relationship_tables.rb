class AddUniqueIndexToManyToManyRelationshipTables < ActiveRecord::Migration
  def change
  	add_index :user_skills, [:user_id, :skill_id], unique: true
  	add_index :user_organizations, [:user_id, :organization_id], unique: true
  	add_index :event_skills, [:event_id, :skill_id], unique: true
  end
end
