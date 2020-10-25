class Playlist < ApplicationRecord
  belongs_to :user
  belongs_to :youtube

  validates :user_id, :youtube_id,  presence: true
end
