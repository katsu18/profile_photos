class CreatePhotoMyprofiles < ActiveRecord::Migration[5.2]
  def change
    create_table :photo_myprofiles do |t|
      t.references :myprofile, foreingn_key: true
      t.references :photo, foreign_key: true
      t.timestamps
    end
  end
end
