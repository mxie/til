class TagsController < ApplicationController
  before_filter :authorize, only: [:index]

  def index
    @tags = Post.tag_counts
  end
end
