class ItemsController < ApplicationController
  def index
  end

  def new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    @item = Item.new
  end

  def create
    if Item.create(item_params)
      redirect_to root_path
    else
      render :new
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
end
