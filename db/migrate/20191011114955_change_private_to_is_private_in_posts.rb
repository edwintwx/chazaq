class ChangePrivateToIsPrivateInPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :private, :isPrivate
  end
end
