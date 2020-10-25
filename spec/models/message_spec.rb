require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end
  describe 'messageが登録できているか' do
    context 'messageを保存できる場合' do
      it 'title, explanation, youtube_id, user_id があれば保存できること' do
        expect(build(@message)).to be_valid
      end
    end
    
    context 'messageを保存できない場合' do
      it 'explanationが空の場合保存できないこと' do
        @message.explanation = " "
        @message.valid?
        expect(@message.errors[:explanation]).to include("を入力してください")
      end
      it 'titleが空の場合保存できないこと' do
        @message.title = " "
        @message.valid?
        expect(@message.errors[:title]).to include("を入力してください")
      end

      it 'group_idが無いと保存できないこと' do
        @message.youtube_id = nil  
        @message.valid?
        expect(@message.errors.full_messages).to include("youtube_id can't be blank")
      end

      it "user_idがないの場合、保存できないこと" do
        @message.user_id = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("user_id can't be blank")
      end
    end
  end
end