class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :description,
      :category_id,
      :product_condition_id,
      :shipping_fee_bearer_id,
      :prefecture_id,
      :days_to_ship_id,
      :price
    ).merge(user_id: current_user.id)
  end
end
