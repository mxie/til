require 'spec_helper'

feature 'User deletes posts' do
  scenario 'they created' do
    user = create(:user)
    post = create(:post, user: user)
    sign_in_with(user.email, user.password)

    click_on I18n.t('posts.destroy.link')
    page.should_not have_content(post.lesson)
    page.should have_content(I18n.t('posts.destroy.success'))
  end

  scenario 'they did not create' do
    signed_in_user = create(:user)
    other_user = create(:user)
    post = create(:post, user: other_user)
    sign_in_with(signed_in_user.email, signed_in_user.password)

    page.should_not have_link(I18n.t('posts.destroy.link'))
  end

end
