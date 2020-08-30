require 'rails_helper'
RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload("/files/test_image.jpg")
    end

    describe '商品情報の保存' do
      context '商品情報の保存がうまくいくとき' do
        it 'name、explanation、category_id、condition_id、delivery_fee_id、shipping_origin_id、days_until_shipping_id、valueが存在すれば商品情報の保存がうまくいく' do
          expect(@item).to be_valid
        end
      end
    end

    context '商品情報の保存がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空だと登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'delivery_fee_idが空だと登録できない' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it 'shipping_origin_idが空だと登録できない' do
        @item.shipping_origin_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping origin can't be blank")
      end
      it 'days_until_shipping_idが空だと登録できない' do
        @item.days_until_shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days until shipping can't be blank")
      end
      it 'valueが空だと登録できない' do
        @item.value = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Value can't be blank")
      end
    end
  end
end
