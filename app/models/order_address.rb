class OrderAddress
  
  include ActiveModel::Model
  attr_accessor :user_id,
                :item_id,
                :zipcode,
                :prefecture_id,
                :city,
                :block,
                :building_and_room,
                :telephone_number, 
                :token,
                :postal_code,
                :addresses,
                :phone_number

  with_options presence: true do
    validates :token
    validates :postal_code,          format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :prefecture_id,    numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'Input only number' }
  end

  def save
    order = Order.new(user_id: current_user.id, item_id: @item.id)
    order.save
    DeliveryAddress.create(
      zipcode: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      block: addresses,
      building_and_room: building_and_room,
      telephone_number: phone_number,
      order_id: order.id )
  end
end