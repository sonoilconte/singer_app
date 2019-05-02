class AddMediaToArtist < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :media, :text
  end
end
