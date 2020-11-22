class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :messages,       dependent: :destroy
  has_many :playlists,  dependent: :destroy
  has_many :playlist_youtubes, through: :playlists, source: :youtube
  validates :nickname, presence:true
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i} #同一メールアドレスを登録できないようにする。
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :likes, dependent: :destroy
  has_many :like_messages, through: :likes, source: :message
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader

  # follow user
  def follow(other_user)
    following << other_user
  end

  # unfollow user
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # return true when an user following another user
  def following?(other_user)
    following.include?(other_user)
  end

  # like a message
  def like(message)
    like_messages << message
  end

  # unlike a message
  def unlike(message)
    like_messages.delete(message)
  end

  # return true when an user likes a message
  def like?(message)
    like_messages.include?(message)
  end

end
