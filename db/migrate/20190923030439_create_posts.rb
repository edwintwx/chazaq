class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.text :content
      t.boolean :request
      t.boolean :testimonial

      t.timestamps
    end
  end
end
