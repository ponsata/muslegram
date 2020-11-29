require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.create(:comment)
  end 
  describe 'commentが登録できているか' do
    context 'commentを保存できる場合' do
      it 'comment, message_id, user_id がある場合' do
        expect(@comment).to be_valid
      end
    end
    
    context 'commentを保存できない場合' do
      it 'commentが空の場合' do
        @comment.comment = nil
        @comment.valid?
        expect(@comment).to_not be_valid
      end
      it 'commentが140文字以上の場合' do
        @comment.comment = 'a' * 141
        @comment.valid?
        expect(@comment).to_not be_valid
      end
      it 'message_idが無い場合' do
        @comment.message = nil 
        @comment.valid?
        expect(@comment).to_not be_valid
      end
      
      it "user_idがないの場合" do
        @comment.user = nil
        @comment.valid?
        expect(@comment).to_not be_valid
      end
    end
  end
end
