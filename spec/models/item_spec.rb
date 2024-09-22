require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user) # ここでユーザーを作成
    @item = FactoryBot.build(:item, user: @user) # 作成したユーザーを関連付ける
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it '全部の情報を入力すれば商品を出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない場合' do
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'status_idが空では出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it 'responsibility_idが空では出品できない' do
        @item.responsibility_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Responsibility can't be blank")
      end

      it 'region_idが空では出品できない' do
        @item.region_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end

      it 'time_idが空では出品できない' do
        @item.time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Time can't be blank")
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end
