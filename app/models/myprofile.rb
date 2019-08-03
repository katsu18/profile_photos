class Myprofile < ApplicationRecord
  has_many :photo_myprofile ,dependent: :destroy
  has_many :photos, through: :photo_myprofile ,dependent: :destroy
end
