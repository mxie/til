class PostsController < ApplicationController

  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to root_path
    else
      @posts = Post.all
      render 'index'
    end
  end
end
