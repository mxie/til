class UsersController < Clearance::UsersController
  before_filter :authorize, only: [:index, :show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
  end

  def update
    if current_user.update_attributes(params[:user])
      flash[:success] = t('settings.success')
      sign_in current_user
      redirect_to edit_user_path(current_user)
    else
      render 'edit'
    end
  end
end
