class OrdersController < ApplicationController
  before_action :find_item, only: [:new, :create]
  before_action :redirect_seller_to_root, only: [:new, :create]
  before_action :redirect_if_soldout, only: [:new, :create]
  before_action :authenticate_user!, only: [:new, :create]
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
    ).merge(user_id: current_user.id).merge(item_id: @item.id).merge(token: params[:token])
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def redirect_seller_to_root
    return unless user_signed_in? && current_user == @item.user

    redirect_to root_path
  end

  def redirect_if_soldout
    redirect_to root_path unless @item.order.nil?
  end
end
