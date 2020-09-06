require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  let(:item_purchase) { FactoryBot.create(:item_purchase, user_id: user.id, item_id: item.id) }
  describe UserPurchase do
    before do
      @user_purchase = FactoryBot.build(:user_purchase)
    end

    describe '購入機能' do
      context '購入者情報の保存がうまくいくとき' do
        it 'postal_code、prefectures_id、city、address、phone_numberが存在すれば商品情報の保存がうまくいく' do
          expect(@user_purchase).to be_valid
        end
      end
    end

    context '購入者情報の保存がうまくいかないとき' do
      it 'postal_codeが空だと登録できない' do
        @user_purchase.postal_code = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefectures_idが空だと登録できない' do
        @user_purchase.prefectures_id = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Prefectures can't be blank")
      end
      it 'cityが空では登録できない' do
        @user_purchase.city = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では登録できない' do
        @user_purchase.address = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @user_purchase.phone_number = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end
