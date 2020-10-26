class OrderAddress
  
  include ActiveModel::Model
  attr_accessor :user_id,
                :item_id,
                :zipcode,
                :prefecture,
                :city,
                :block,
                :building_and_room,
                :telephone_number, 
                :token,

  with_options presence: true do
    # validates :token
    validates :zip_code,          format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :prefecture,    numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :block
    validates :telephone_number, format: { with: /\A[0-9]+\z/, message: 'Input only number' }
  end

  def save
    order = Order.new(user_id: current_user.id, item_id: @item.id)
    order.save
    DeliveryAddress.create(
      zipcode: zipcode,
      prefecture: prefecture,
      city: city,
      block: block,
      building_and_room: building_and_room,
      telephone_number: telephone_number,
      order_id: order.id )
  end
end