class AddUserIdToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :user_id, :integer
  end
end
