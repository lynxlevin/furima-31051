require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '正常な動作の確認' do
      it 'zipcodeとprefecture_idとcityとblockとbuilding_and_roomと
      telephone_numberとtokenが存在すれば登録できること' do
        expect(@order_address).to be_valid
      end
    end

    context 'バリデーションの確認' do
      it 'zipcodeが無いときは登録できないこと' do
        @order_address.zipcode = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'zipcodeにはハイフンが必要であること' do
        @order_address.zipcode = rand(1000000..9999999)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'zipcodeの桁数が違えば登録できないこと' do
        @order_address.zipcode = "11-11111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'zipcodeに数字かハイフン以外の入力があれば登録できないこと' do
        @order_address.zipcode = "111-111a"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'prefecture_idが1のときは登録できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture Select")
      end
      it 'cityが無いときは登録できないこと' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが無いときは登録できないこと' do
        @order_address.block = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'telephone_numberが無いときは登録できないこと' do
        @order_address.telephone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'telephone_numberにハイフンがあるときは登録できないこと' do
        @order_address.telephone_number = "000-0000-0000"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number Input only number")
      end
      it 'telephone_numberに数字以外の入力があるときは登録できないこと' do
        @order_address.telephone_number = "0000000000a"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number Input only number")
      end
      it 'tokenが無いときは決済できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
