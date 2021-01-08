require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '決済処理' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    context '決済処理ができる時' do
      it '全ての情報が正しく入力されていれば決済処理が行われる' do
        expect(@user_order).to be_valid
      end
    
      it 'builidngが空でも保存できる' do
        @user_order.building = nil
        expect(@user_order).to be_valid
      end
    end

    context '決済処理ができない時' do
      it 'tokenが空では決済処理ができないこと' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
    
      it 'postal_codeが空では保存できないこと' do
        @user_order.postal_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end
    
      it 'postal_codeに-(ハイフン）が使われていないと保存できないこと' do
        @user_order.postal_code = '1234567'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
    
      it 'postal_codeが全角数字だと保存できないこと' do
        @user_order.postal_code = '１２３ー４５６７'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'postal_codeの数字はハイフンの前に３つ、ハイフンの後に４つ無いと保存できないこと' do
        @user_order.postal_code = '1234-567'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'prefectureが選択されていないと保存できないこと' do
        @user_order.prefecture_id = 0
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture must be selected")
      end
    
      it 'addressが空だと保存できないこと' do
        @user_order.address = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address can't be blank")
      end
    
      it 'phone_numberが空だと保存できないこと' do
        @user_order.phone_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが全角数字だと保存できないこと' do
        @user_order.phone_number = '１２３４５６７８９１０'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number Input half-width numbers")
      end

      it 'phone_numberが11桁より多いと保存できないこと' do
        @user_order.phone_number = '123456789101'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it 'phone_numberが9桁以下だと保存できないこと' do
        @user_order.phone_number = '123456789'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end
    end
  end
end
