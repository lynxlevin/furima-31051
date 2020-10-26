class OrderAddress
  
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zipcode, :prefecture_id, :city, :block, :building_and_room, :telephone_number

  with_options presence: true do
    validates :zipcode,          format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :city
    validates :block
    validates :telephone_number, format: { with: /\A[0-9]+\z/, message: 'Input only number' }
  end
  validates :prefecture_id,    numericality: { other_than: 1, message: 'Select' }
