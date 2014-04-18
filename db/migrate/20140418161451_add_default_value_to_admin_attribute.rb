class AddDefaultValueToAdminAttribute < ActiveRecord::Migration
	def up
	    change_column :user_organizations, :admin, :boolean, :default => false
	end

	def down
	    change_column :user_organizations, :admin, :boolean, :default => nil
	end
end
