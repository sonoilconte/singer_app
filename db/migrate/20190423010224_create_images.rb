class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :name
      t.string :category
      t.integer :order

      t.timestamps
    end
  end
end