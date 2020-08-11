require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入時の送り先の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '商品購入がうまくいったとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end 
      it 'building_name以外が正しく入力されていれば保存できること' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end 
    end
      
    context '商品購入がうまくいったとき' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと保存できない' do
        @order_address.postal_code = "1111111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'regionが空だと保存できない' do
        @order_address.region_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Region can't be blank")
      end
      it 'cityが空だと保存できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'street_numberが空だと保存できない' do
        @order_address.street_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street number can't be blank")
      end
      it 'phoneが空だと保存できない' do
        @order_address.phone = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが全角数字だと保存できないこと' do
        @order_address.phone = "０９０８８８８８８８８"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is not a number")
      end
    end
  end
end