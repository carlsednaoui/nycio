class AddImageUrlToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :image_url, :string
  end
end
