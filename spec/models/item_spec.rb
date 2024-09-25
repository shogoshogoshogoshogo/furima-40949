require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: @user)
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

      it 'category_idが1では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category を選択してください')
      end

      it 'status_idが1では出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status を選択してください')
      end

      it 'responsibility_idが1では出品できない' do
        @item.responsibility_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Responsibility を選択してください')
      end

      it 'region_idが1では出品できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Region を選択してください')
      end

      it 'delivery_time_idが1では出品できない' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery time を選択してください')
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300以上9999999以下である必要があります')
      end

      it 'priceが300未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300以上9999999以下である必要があります')
      end

      it 'priceが9999999を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300以上9999999以下である必要があります')
      end

      it 'priceに半角数字以外が含まれていると出品できない' do
        @item.price = '300a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300以上9999999以下である必要があります')
      end

      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
