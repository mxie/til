class PostsController < ApplicationController

  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.create(params[:post])
    redirect_to root_path
  end
end
