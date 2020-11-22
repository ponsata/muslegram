class Message < ApplicationRecord
  validates :title, :explanation, :youtube_id, :user_id,  presence:true
  belongs_to :user
  belongs_to :youtube
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
end
