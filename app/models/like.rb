class Like < ApplicationRecord
  belongs_to :message
  belongs_to :user
  validates :message_id, presence: true
  validates :user_id, presence: true
end
