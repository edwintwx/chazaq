class Post < ApplicationRecord
  validates :content, presence: true
  validates :request, default: false
  validates :testimonial, default: false
  has_many :hearts
  has_many :comments
  has_many :post_photos
  belongs_to :user
end
