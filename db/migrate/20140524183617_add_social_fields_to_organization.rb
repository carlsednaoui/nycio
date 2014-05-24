class AddSocialFieldsToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :twitter_url, :string
    add_column :organizations, :facebook_url, :string
  end
end
