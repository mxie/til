class SessionsController < Clearance::SessionsController
  def create
    user = authenticate(params)

    if user.nil?
      flash_failure_after_create
      render 'homes/index', status: :unauthorized
    else
      sign_in user
      redirect_back_or url_after_create
    end
  end

  private

  def url_after_destroy
    root_url
  end
end
