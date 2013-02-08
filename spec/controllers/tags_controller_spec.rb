require 'spec_helper'

describe TagsController do
  describe 'index' do
    it 'allows signed-in users to see a list of tags' do
      sign_in

      get :index

      should respond_with(:success)
    end

    it 'does not allow visitors to see a list of tags' do
      get :index

      should deny_access(flash: I18n.t('flashes.failure_when_unauthorized'))
    end
  end

  describe 'show' do
    it 'allows signed-in users to view associated posts for a tag' do
      sign_in

      get :show, id: tag.name

      should respond_with(:success)
    end

    it 'does not allow visitors to view a user profile page' do
      get :show, id: tag.name

      should deny_access(flash: I18n.t('flashes.failure_when_unauthorized'))
    end

    def tag
      post = create(:tagged_post)
      post.tags.first
    end
  end
end
