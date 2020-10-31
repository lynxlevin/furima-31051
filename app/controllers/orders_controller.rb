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
      pay_item
      @order_address.save
      return redirect_to root_path
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
      :telephone_number,
      :token
    ).merge(user_id: current_user.id, item_id: @item.id, price: @item.price)
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def redirect_seller_to_root
    redirect_to root_path if user_signed_in? && current_user == @item.user
  end

  def redirect_if_soldout
    redirect_to root_path if @item.order.present?
  end
end
