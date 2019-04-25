class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :url
      t.datetime :datetime
      t.boolean :archived

      t.timestamps
    end
  end
end
