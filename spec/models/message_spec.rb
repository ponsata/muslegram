require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.create(:message)
  end 
  describe 'messageが登録できているか' do
    context 'messageを保存できる場合' do
      it 'title, explanation, youtube_id, user_id があれば保存できること' do
        expect(@message).to be_valid
      end
    end
    
    context 'messageを保存できない場合' do
      it 'explanationが空の場合保存できないこと' do
        @message.explanation = nil
        @message.valid?
        expect(@message).to_not be_valid
      end
      it 'titleが空の場合保存できないこと' do
        @message.title = nil
        @message.valid?
        expect(@message).to_not be_valid
      end
      
      it 'youtube_idが無いと保存できないこと' do
        @message.youtube = nil  
        @message.valid?
        expect(@message).to_not be_valid
      end
      
      it "user_idがないの場合、保存できないこと" do
        @message.user = nil
        @message.valid?
        expect(@message).to_not be_valid
      end
    end
    context '削除検証' do
      describe '削除の検証' do
        it '記事を削除したら紐づくlikeも削除されること' do
          FactoryBot.create(:like, message: @message)
          expect { @message.destroy }.to change(@message.likes, :count).by(-1)
        end
    
        it '記事を削除したら紐づくcommentも削除されること' do
          FactoryBot.create(:comment, message: @message)
          expect {@message.destroy }.to change(@message.comments, :count).by(-1)
        end
      end
    end
  end
end