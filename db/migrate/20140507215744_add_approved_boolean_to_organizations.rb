class AddApprovedBooleanToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :approved, :boolean, default: false
  end
end
