class Post < ApplicationRecord
   belongs_to :user
   has_many :comments, dependent: :destroy
   validates :images, presence: true
   has_many_attached :images, dependent: :destroy
   has_many :likes, dependent: :destroy
end
