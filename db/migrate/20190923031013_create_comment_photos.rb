class CreateCommentPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_photos do |t|
      t.string :photo
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
