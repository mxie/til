class UsersController < Clearance::UsersController
  before_filter :authorize, only: [:index, :show]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end
end
