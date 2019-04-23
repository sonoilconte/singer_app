class RemoveManagementFromArtists < ActiveRecord::Migration[6.0]
  def change
    remove_column :artists, :management, :string
  end
end
