class AddContactFieldsToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :contact_name, :string
    add_column :organizations, :contact_email, :string
    add_column :organizations, :contact_phone, :string
  end
end
