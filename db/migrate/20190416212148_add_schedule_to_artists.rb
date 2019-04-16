class AddScheduleToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :schedule, :text
  end
end
