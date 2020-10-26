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
                :token

  with_options presence: true do
    validates :zipcode,          format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :city
    validates :block
    validates :telephone_number, format: { with: /\A[0-9]+\z/, message: 'Input only number' }
    validates :token
  end
  validates :prefecture_id,    numericality: { other_than: 1, message: 'Select' }

  def save
    order = Order.new(user_id: current_user.id, item_id: @item.id)
    order.save
    DeliveryAddress.create(
      zipcode: zipcode,
      prefecture_id: prefecture_id,
      city: city,
      block: block,
      building_and_room: building_and_room,
      telephone_number: telephone_number,
      order_id: order.id )
  end
end