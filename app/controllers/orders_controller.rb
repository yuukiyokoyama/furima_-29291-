class OrdersController < ApplicationController
  before_action :set_item, only: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item.create(item_params)
  end
end

private

def set_item
  @item = Item.find(params[:item_id])
end
