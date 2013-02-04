class PostsController < ApplicationController
  DEFAULT_PER_PAGE = 10

  before_filter :authorize, only: [:index, :create]

  def index
    @post = current_user.posts.build
    @posts = paginated_posts
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
    Post.paginate(page: params[:page], per_page: DEFAULT_PER_PAGE)
  end
end
