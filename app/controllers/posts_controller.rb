class PostsController < ApplicationController
  before_filter :authorize, only: [:index, :create]

  def index
    @post = current_user.posts.build
    @posts = paginated_posts
    @cloud_tags = Post.tag_counts
  end

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      redirect_to root_path
    else
      @posts = paginated_posts
      render 'index'
    end
  end

  private

  def paginated_posts
    Post.paginate(page: params[:page])
  end
end
