class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :find_item, only: [:show, :destroy]
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

  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
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

  def find_item
    @item = Item.find(params[:id])
  end
end
