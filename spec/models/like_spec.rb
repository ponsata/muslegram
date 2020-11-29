require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @like = FactoryBot.create(:like)
  end 
  describe 'likeが登録できているか' do
    context 'likeを保存できる場合' do
      it 'like, message_id, user_id があれば保存できること' do
        expect(@like).to be_valid
      end
    end
    
    context 'likeを保存できない場合' do
      it 'message_idが無いと保存できないこと' do
        @like.message = nil 
        @like.valid?
        expect(@like).to_not be_valid
      end
      
      it "user_idがないの場合、保存できないこと" do
        @like.user = nil
        @like.valid?
        expect(@like).to_not be_valid
      end
    end
  end
end
