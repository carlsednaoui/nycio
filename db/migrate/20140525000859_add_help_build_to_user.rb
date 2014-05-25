class AddHelpBuildToUser < ActiveRecord::Migration
  def change
    add_column :users, :help_build, :boolean
  end
end
