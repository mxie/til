class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery

  def authorize
    unless signed_in?
      deny_access(I18n.t('flashes.failure_when_unauthorized'))
    end
  end
end
