require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @user1 = FactoryBot.create(:user)
   
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、password、password_confirmationが存在すれば、登録できる' do
      expect(@user).to be_valid
      end
      it 'imageが存在しなくても登録できる' do
        @user.image = nil  
        expect(@user).to be_valid
      end
      it 'imageが存在しなくても登録できる' do
        @user.profile = nil  
        expect(@user).to be_valid
      end
      it '正しいフォーマットのemailは有効であること' do
        @user.email = 'test@example.com'
        expect(@user).to be_valid
      end
    end
    
    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では、登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user).to_not be_valid
      end
      it 'emailが空では、登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user).to_not be_valid
      end
      it '不正なフォーマットのemailは無効であること' do
        @user.email = 'test@exmample,com'
        @user.valid?
        expect(@user).to_not be_valid
      end
      it 'emailがすでに登録してあるものと重複している場合、登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user).to_not be_valid
      end
      it 'emailに@が含まれていない場合、登録できない' do
        @user.email = 'aaaexample.com'
        @user.valid?
        expect(@user).to_not be_valid
      end
      it 'passwordが空では、登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user).to_not be_valid
      end
      it 'passwordが7文字以下の場合、登録できない' do
        @user.password = 'a' * 7
        @user.password_confirmation = 'a' * 7
        @user.valid?
        expect(@user).to_not be_valid
      end
      it 'passwordにかな文字が含まれる場合,登録できない' do
        @user.password = 'おにぎりたべたい'
        @user.valid?
        expect(@user).to_not be_valid
      end
      it 'passwordが存在してもpassword_confirmationが空では、登録できない' do
        @user.password_confirmation = nil
        @user.valid?
        expect(@user).to_not be_valid
      end
      it 'passwordとpassword_confirmationが一致しない場合、登録できない' do
        @user.password = 'password1'
        @user.password_confirmation = 'password2' 
        @user.valid?
        expect(@user).to_not be_valid
      end
    end
    context '削除検証' do
      describe '削除の検証' do
        it 'ユーザーを削除したら紐づくlikeも削除されること' do
          FactoryBot.create(:like, user: @user)
          expect { @user.destroy }.to change(@user.likes, :count).by(-1)
        end
    
        it 'ユーザーを削除したら紐づくcommentも削除されること' do
          FactoryBot.create(:comment, user: @user)
          expect { @user.destroy }.to change(@user.comments, :count).by(-1)
        end
        it 'ユーザーを削除したら紐づくplaylistも削除されること' do
          FactoryBot.create(:playlist, user: @user)
          expect { @user.destroy }.to change(@user.playlists, :count).by(-1)
        end
        it 'ユーザーを削除したら紐づくフォロワーも削除されること' do

          @user.follow(@user1)
          expect { @user.destroy }.to change(@user1.followers, :count).by(-1)
        end
        it 'ユーザーを削除したら紐づくフォローも削除されること' do

          @user.follow(@user1)
          expect { @user.destroy }.to change(@user.following, :count).by(-1)
        end
      end
    end
  end
end