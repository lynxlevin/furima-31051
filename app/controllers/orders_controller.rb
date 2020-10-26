class OrdersController < ApplicationController
  before_action :find_item, only: [:new, :create]
  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_address).permit(
      :zipcode,
      :prefecture_id,
      :city,
      :block,
      :building_and_room,
      :telephone_number
      ).merge(user_id: current_user.id).merge(item_id: @item.id)
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

end
