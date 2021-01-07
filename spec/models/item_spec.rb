require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品登録ができる時' do
      it '全ての情報が正しく入力されていれば商品が保存できること' do
        expect(@item).to be_valid
      end
    end

    context '商品登録ができない時' do
      it 'imageが空だと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空だと保存できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'infoが空だと保存できないこと' do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it 'categoryが選択されていないと保存できないこと' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be selected')
      end

      it 'sales_statusが選択されていないと保存できないこと' do
        @item.sales_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status must be selected')
      end

      it 'shipping_fee_statusが選択されていないと保存できないこと' do
        @item.shipping_fee_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee status must be selected')
      end

      it 'prefectureが選択されていないと保存できないこと' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be selected')
      end

      it 'scheduled_deliveryが選択されていないと保存できないこと' do
        @item.scheduled_delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled delivery must be selected')
      end

      it 'priceが空だと保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceの値が300未満だと保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it 'priceの値が10000000以上だと保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it 'priceが全角数字だと保存できないこと' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width numbers.')
      end

      it 'priceが半角英数混合だと保存できないこと' do
        @item.price = 'a1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width numbers.')
      end

      it 'priceが半角英語だけだと保存できないこと' do
        @item.price = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width numbers.')
      end
    end
  end
end
