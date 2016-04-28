class RemovePhotoUrlFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :photo_url, :string
  end
end
