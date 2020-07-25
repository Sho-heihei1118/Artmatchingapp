class GenrePicture < ApplicationRecord
  belongs_to :picture
  belongs_to :artgenre
end
