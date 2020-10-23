class Item < ApplicationRecord
  belongs_to       :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :shipping_fee_bearer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_to_ship

  with_options presence: true do
    validates :name
    validates :description
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 10000000 }# , format: { with: /[\d]]+/, message: 'Half-width number' }
    validates :category_id
    validates :product_condition_id
    validates :shipping_fee_bearer_id
    validates :prefecture_id
    validates :days_to_ship_id
    validates :user, foreign_key: true
  end
end
