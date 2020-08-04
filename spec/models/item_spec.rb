require 'rails_helper'

RSpec.describe Item, type: :model do

    describe '商品出品投稿機能' do
      before do
        @item = FactoryBot.build(:item)
        @item.image = fixture_file_upload('public/images/kikorin.jpg')
      end

      context '商品投稿がうまくいくとき' do
      it 'imageとnameとinfoとcategoryとitem_satusとdelivery_feeとregionとdelivery_dayとpriceがあれば保存できる' do
        expect(@item).to be_valid
        expect(@item.image).to be_valid
      end 
      it 'nameが40文字以内なら保存できる' do
        @item.name = "嵐の櫻井翔のうちわ"
        expect(@item).to be_valid
      end
      it 'infoが1000文字以内なら保存できる' do
        @item.info = "もう使わないので、ファンの方に買って欲しいです"
        expect(@item).to be_valid
      end
      end

      context '商品投稿がうまくいかないとき' do
      it 'imageが空だと保存ができない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと保存ができない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'infoが空だと保存ができない' do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'priceが空だと保存ができない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数値以外だと保存できない' do
        @item.price = "５０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが300~9,999,999円以外だと保存ができない' do
        @item.price = "200" 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price out of setting range")
      end
      it 'categoryが空だと保存ができない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it 'item_statusが空だと保存ができない' do
        @item.item_status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status Select")
      end
      it 'delivery_feeが空だと保存ができない' do
        @item.delivery_fee = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee Select")
      end
      it 'regionが空だと保存ができない' do
        @item.region = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Region Select")
      end
      it 'delivery_dayが空だと保存ができない' do
        @item.delivery_day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day Select")
      end
      





      end
    
    end




end
