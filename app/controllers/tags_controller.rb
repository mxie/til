class TagsController < ApplicationController
  before_filter :authorize, only: [:index, :show]

  def index
    @tags = Post.tag_counts
  end

  def show
    @tag = Tag.find_by_name(params[:id])
    @posts = Post.tagged_with(params[:id]).paginate(page: params[:page])
    @cloud_tags = Post.tag_counts
  end
end
