class CreateJoinTableUsersArtists < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :artists do |t|
      # t.index [:user_id, :artist_id]
      # t.index [:artist_id, :user_id]
    end
  end
end
