require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @other_user = FactoryBot.create(:user)
    @relationship = Relationship.new(follower_id: @user.id, followed_id: @other_user.id )
  end
  describe 'フォロー/フォロワーが登録できているか' do
    context '登録できている場合' do
      it "follower_idとfollowed_idがあれば保存できる" do
        expect(@relationship).to be_valid
      end
    end 
    
    context '登録できない場合' do
      it "follower_idがnilの場合、無効であること" do
        @relationship.follower_id = nil
        @relationship.valid?
        expect(@relationship).to_not be_valid
      end
      it "followed_idがnilの場合、無効であること" do
        @relationship.followed_id = nil
        @relationship.valid?
        expect(@relationship).to_not be_valid
      end
    end
  end
end
