require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        user = User.new(
          name: 'Example User',
          email: 'user@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
        expect(user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nameが空では登録できない' do
        user = User.new(name: nil)
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end

      it 'emailが空では登録できない' do
        user = User.new(email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it 'passwordが空では登録できない' do
        user = User.new(password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end
    end
  end
end
