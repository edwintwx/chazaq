class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, PhotoUploader
  after_create :send_welcome_mail

  acts_as_followable
  acts_as_follower

  # has_many :follows
  has_many :posts
  has_many :hearts

  # has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  # has_many :followers, through: :follower_relationships, source: :follower

  # has_many :following_relationships, foreign_key: :user_id, class_name: 'Follow'
  # has_many :following, through: :following_relationships, source: :following

  private

  def send_welcome_mail
    UserMailer.with(user: self).welcome.deliver_now
  end
end
