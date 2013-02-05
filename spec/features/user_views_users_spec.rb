require 'spec_helper'

feature 'User views users page' do
  background do
    signed_in_user
  end

  scenario 'and can see a list of all users' do
    create_list(:user, 5)

    visit users_path

    User.all.each do |user|
      page.should have_selector('td', text: user.display_name)
    end
  end

  scenario 'and clicks on a user' do
    other_user = create(:user)
    posts = create_list(:post, 5, user: other_user)

    visit users_path
    click_link other_user.display_name

    page.should have_content(other_user.display_name)
    posts.each do |post|
      page.should have_content(post.lesson)
    end
  end
end
