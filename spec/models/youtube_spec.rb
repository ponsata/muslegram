require 'rails_helper'

RSpec.describe Youtube, type: :model do
  before do
    @youtube = FactoryBot.create(:youtube)
  end
  describe 'youtubeが登録できているか' do
    context 'youtubeを保存できる場合' do
      it 'channel_id, channel_title, title, description, video_id,があれば保存できること' do
        expect(@youtube).to be_valid
      end
    end
    
    context 'youtubeを保存できない場合' do
      it 'channel_idが空の場合保存できないこと' do
        @youtube.channel_id = " "
        @youtube.valid?
        expect(@youtube).to_not be_valid
      end
      it 'channel_titleが空の場合保存できないこと' do
        @youtube.channel_title = " "
        @youtube.valid?
        expect(@youtube).to_not be_valid
      end

      it 'titleが無いと保存できないこと' do
        @youtube.title = nil  
        @youtube.valid?
        expect(@youtube).to_not be_valid
      end

      it "descriptionがないの場合、保存できないこと" do
        @youtube.description = nil
        @youtube.valid?
        expect(@youtube).to_not be_valid
      end
      
      it "video_idがないの場合、保存できないこと" do
        @youtube.video_id = nil
        @youtube.valid?
        expect(@youtube).to_not be_valid
      end
      it 'video_idがすでに登録してあるものと重複している場合、登録できない' do
        @youtube.save
        another_youtube = FactoryBot.build(:youtube)
        another_youtube.video_id = @youtube.video_id
        another_youtube.valid?
        expect(another_youtube).to_not be_valid
      end
    end
  end
end