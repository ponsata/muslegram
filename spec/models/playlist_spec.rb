require 'rails_helper'

RSpec.describe Playlist, type: :model do

  before do
    @playlist = FactoryBot.create(:playlist)
  end
  describe 'いいねが登録できているか' do
    context '登録できている場合' do
      it "user_idとyoutube_idがあれば保存できる" do
        expect(@playlist).to be_valid
      end
    end 
    
    context '登録できない場合' do
      it "user_idがnilの場合、無効であること" do
        @playlist.user = nil
        @playlist.valid?
        expect(@playlist).to_not be_valid
      end
      it "youtube_idがnilの場合、無効であること" do
        @playlist.youtube = nil
        @playlist.valid?
        expect(@playlist).to_not be_valid
      end
    end
  end
end

