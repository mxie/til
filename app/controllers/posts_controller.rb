class PostsController < ApplicationController
  before_filter :authorize, only: [:index, :create]

  def index
    @post = current_user.posts.build
    @posts = Post.all
  end

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      redirect_to root_path
    else
      @posts = Post.all
      render 'index'
    end
  end
end
