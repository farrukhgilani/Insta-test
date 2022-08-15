class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :followers, class_name: "Friendship", foreign_key: "follower_id"
  has_many :followed, through: :followers

  has_many :followed, class_name: "Friendship", foreign_key: "followed_id"
  has_many :followers, through: :followed

  has_many :posts
end
