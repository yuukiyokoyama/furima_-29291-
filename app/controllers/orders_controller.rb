class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @item = Item.new
  end

  def create
    @item.create(item_params)
  end
end

# def create
#   Order.create(order_params)
# end

# private
# def order_params
#   params.require(:order).permit(:item).merge(user_id: current_user.id, item_id: params[:item_id])
# end
# end
