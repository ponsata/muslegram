class Message < ApplicationRecord
  validates :title, :explanation,   presence:true
  belongs_to :user
  belongs_to :youtube
end
