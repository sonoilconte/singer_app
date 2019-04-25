class Event < ApplicationRecord
  belongs_to :artist
  has_one_attached :image
  has_rich_text :description
end
