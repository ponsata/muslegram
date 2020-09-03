class Youtube < ApplicationRecord
  validates :channel_id, :channel_title, :video_id, :description, presence:true
  validates :video_id, uniqueness: true
end
