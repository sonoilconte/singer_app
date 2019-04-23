class AddArtistIdToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :artist_id, :integer
    add_index :images, :artist_id
  end
end
