class ShippingFeeBearer < ActiveHash::Base
  self.data = [
    { id: 1, '---' },
    { id: 2, '着払い(購入者負担)' },
    { id: 3, '送料込み(出品者負担)' },
  ]
end
