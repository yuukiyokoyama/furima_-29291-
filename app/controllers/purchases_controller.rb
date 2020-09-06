class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, except: [:index, :show]

  def index
    if user_signed_in? && current_user.id == @item.user_id 
      redirect_to root_path
    end
    @purchase = UserPurchase.new
  end

  def create
    @purchase = UserPurchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.permit(:postal_code, :prefectures_id, :city, :address, :building_name, :phone_number, :item_id, :token, :item_purchases_id ).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    @item = Item.find(params[:item_id])
    Payjp::Charge.create(
      amount: @item.value,  # 商品の値段
      card: params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end