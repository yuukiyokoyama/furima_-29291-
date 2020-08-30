class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]
  # before_action :move_to_new, except: [:new, :show]

  def index
    @item = Item.all
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

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :value, :category_id,  :condition_id, :delivery_fee_id, :shipping_origin_id, :days_until_shipping_id).merge(user_id: current_user.id)
  end
end