class AddDefaultFalseToHelpBuildUsers < ActiveRecord::Migration
  def change
  	change_column :users, :help_build, :boolean, :default => false
  end
end
