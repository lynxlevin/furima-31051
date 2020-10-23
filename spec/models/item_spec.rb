require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '正常な動作の確認' do
    it 'imageとnameとdescriptionとcategory_idとproduct_condition_idと
      shipping_fee_bearer_idとprefecture_idとdays_to_ship_idとpriceが
      存在すれば登録できること' do
      expect(@item).to be_valid
    end
  end

  context 'バリデーションの確認' do
    it '商品画像を1枚つけることが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が必須であること' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が必須であること' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end
    it '商品の状態についての情報が必須であること' do
      @item.product_condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Sales status Select')
    end
    it '配送料の負担についての情報が必須であること' do
      @item.shipping_fee_bearer_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee status Select')
    end
    it '発送元の地域についての情報が必須であること' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture Select')
    end
    it '発送までの日数についての情報が必須であること' do
      @item.days_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Scheduled delivery Select')
    end
    it '価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格が¥299以下では登録できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it '価格が¥100,000,000以上では登録できないこと' do
      @item.price = 100_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = 'abc'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
  end
end
