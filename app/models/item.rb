class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to             :user
  has_one_attached       :image
  has_one                :order
  belongs_to_active_hash :category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :shipping_fee_bearer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_to_ship

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price,
              format: {
                with: /[\d]+/,
                message: 'Half-width number'
              },
              numericality: {
                only_integer: true,
                greater_than_or_equal_to: 300,
                less_than: 10_000_000,
                message: 'Out of setting range'
              }
    validates :category_id,            numericality: { other_than: 1, message: 'Select' }
    validates :product_condition_id,   numericality: { other_than: 1, message: 'Select' }
    validates :shipping_fee_bearer_id, numericality: { other_than: 1, message: 'Select' }
    validates :prefecture_id,          numericality: { other_than: 1, message: 'Select' }
    validates :days_to_ship_id,        numericality: { other_than: 1, message: 'Select' }
  end
end
