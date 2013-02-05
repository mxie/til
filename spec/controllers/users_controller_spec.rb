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

  describe 'show' do
    it 'allows signed-in users to view a user profile page' do
      user = create(:user)

      sign_in_as(user)
      get :show, id: user.id

      should respond_with(:success)
    end

    it 'does not allow visitors to view a user profile page' do
      user = create(:user)

      get :show, id: user.id

      should deny_access(flash: I18n.t('flashes.failure_when_unauthorized'))
    end
  end
end
