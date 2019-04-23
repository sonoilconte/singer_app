class Artist < ApplicationRecord
  has_many_attached :images
  has_and_belongs_to_many :users
  has_rich_text :biography
  has_rich_text :management
end
