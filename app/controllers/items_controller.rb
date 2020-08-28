class ItemsController < ApplicationController
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
end
