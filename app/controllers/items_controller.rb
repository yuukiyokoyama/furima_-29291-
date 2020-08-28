class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
  end

  def create
    Post.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :text)
  end

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
