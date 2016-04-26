class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :photo_url, null: false
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
