class PostsController < ApplicationController
  def index
  end

  def new
  end

  def create
    Post.create(post_params)
  end

  private

  def ppost_params
    params.require(:post).permit(:name, :image, :text)
  end
end
