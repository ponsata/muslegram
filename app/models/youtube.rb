class Youtube < ApplicationRecord
  
  has_many :messages,   dependent: :destroy
  has_many :playlists,  dependent: :destroy
  validates :channel_id, :channel_title, :title, :video_id, :description, presence:true
  validates :video_id, uniqueness: true
  def playlist_by?(user)
    playlists.where(user_id: user.id).includes(:user, :youtube).exists?
  end

end
