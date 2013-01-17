class HomesController < ApplicationController
  def index
    if signed_in?
      redirect_to posts_path
    end
  end
end
