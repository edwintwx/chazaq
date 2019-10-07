class CreatePostPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :post_photos do |t|
      t.string :photo
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
