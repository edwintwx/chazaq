class CommentPhoto < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :comment
end
