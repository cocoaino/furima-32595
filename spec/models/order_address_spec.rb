require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品の購入ができるとき' do
      it '全ての項目が存在すれば商品を購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物名が空でも商品を購入できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context '商品の購入ができないとき' do
      it "tokenが空では登録できない" do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンが含まれないと購入できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-).')
      end
      it 'shipping_area_idが空では購入できない' do
        @order_address.shipping_area_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'shipping_area_idが1では購入できない' do
        @order_address.shipping_area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Shipping area must be other than 1')
      end
      it 'cityが空では購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では購入できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフンが含まれていると購入できない' do
        @order_address.phone_number = '123-4567-8901'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only half-width numbers.')
      end
      it 'phone_numberに英字が含まれていると購入できない' do
        @order_address.phone_number = '123456789aa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only half-width numbers.')
      end
      it 'phone_numberが12桁以上では購入できない' do
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'phone_numberが全角数字では購入できない' do
        @order_address.phone_number = '１２３４５６７８９０１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only half-width numbers.')
      end
      it 'item_idが空では登録できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空では登録できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end