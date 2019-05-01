class Artist < ApplicationRecord
  has_many_attached :images
  has_one_attached :resume
  has_and_belongs_to_many :users
  has_many :images
  has_many :events
  has_rich_text :biography
  has_rich_text :management
end
