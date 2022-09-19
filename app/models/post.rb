class Post < ApplicationRecord
   belongs_to :user
   has_many :comments
   validates :images, presence: true
   has_many_attached :images
   has_many :likes
end
