class AddManagementUrlToArtists < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :management_url, :string
  end
end
