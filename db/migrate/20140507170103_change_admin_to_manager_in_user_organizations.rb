class ChangeAdminToManagerInUserOrganizations < ActiveRecord::Migration
  def change
  	remove_column :user_organizations, :admin
  	add_column :user_organizations, :manager, :boolean, :default => false
  end
end
