class UsersController < Clearance::UsersController
  before_filter :authorize, only: [:index]

  def index
    @users = User.all
  end
end
