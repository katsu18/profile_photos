class Photo < ApplicationRecord
  mount_uploader :image, ImagesUploader
  has_many :photo_myprofile ,dependent: :destroy
  has_many :myprofile, through: :photo_myprofile ,dependent: :destroy
  validates :content, presence: true
  validates :image, presence: true

  
end
