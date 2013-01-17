class SessionsController < Clearance::SessionsController
  private

  def url_after_destroy
    root_url
  end
end
