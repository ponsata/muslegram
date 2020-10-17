class Message < ApplicationRecord
  validates :title, :explanation, :youtube_id, :user_id,  presence:true
  belongs_to :user
  belongs_to :youtube

end
