class RemoveColsFromArtists < ActiveRecord::Migration[6.0]
  def change
    remove_column :artists, :bio
    remove_column :artists, :schedule 
  end
end
