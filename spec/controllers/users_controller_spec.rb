require 'spec_helper'

describe UsersController do
  describe 'index' do
    it 'allows signed-in users to see a list of users' do
      sign_in

      get :index

      should respond_with(:success)
    end

    it 'does not allow visitors to see a list of users' do
      get :index

      should deny_access(flash: I18n.t('flashes.failure_when_unauthorized'))
    end
  end
end
