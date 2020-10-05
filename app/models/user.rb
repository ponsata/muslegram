class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :messages,       dependent: :destroy
  has_many :playlists,  dependent: :destroy
  has_many :playlist_youtubes, through: :playlists, source: :youtube

  validates :nickname, presence:true
  mount_uploader :image, ImageUploader
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i} #同一メールアドレスを登録できないようにする。
 
  # def already_playlist?(youtube) 
  #   self.playlists.exists?(youtube_id: youtube.id)
  #   
  # end
end
