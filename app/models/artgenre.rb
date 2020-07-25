class Artgenre < ApplicationRecord
  has_many :genre_pictures, dependent: :destroy
  has_many :pictures, through: :genre_pictures
  validates :name, presence: true
end
