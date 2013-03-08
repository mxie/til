require 'spec_helper'

describe PostsController do
  describe 'index' do
    it 'allows signed-in users to see posts' do
      sign_in

      get :index

      should respond_with(:success)
    end

    it 'does not allow visitors to see posts' do
      get :index

      should deny_access(flash: I18n.t('flashes.failure_when_unauthorized'))
    end
  end

  describe 'create' do
    it 'allows signed-in users to write posts' do
      sign_in

      post :create, lesson: 'A lesson'

      should respond_with(:success)
    end

    it 'does not allow visitors to write posts' do
      post :create, lesson: 'A lesson'

      should deny_access(flash: I18n.t('flashes.failure_when_unauthorized'))
    end
  end

  describe 'destroy' do
    context 'when given a post that does not belong to the current user' do
      it 'does not delete the post' do
        user = create(:user)
        other_user = create(:user)
        sign_in_as(user)
        post = create(:post, user: other_user)

        delete :destroy, id: post.id

        Post.find(post.id).should eq post
      end
    end
  end
end
