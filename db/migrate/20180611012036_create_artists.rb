class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :voice_type
      t.string :bio
      t.string :email
      t.string :management

      t.timestamps
    end
  end
end
