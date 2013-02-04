require 'spec_helper'

feature 'User views posts page' do
  scenario 'and sees each post associated with a user' do
    signed_in_user
    posts = create_list(:post, 5)

    visit posts_path

    posts.each do |post|
      page.should have_content(post.user.display_name)
    end
  end
end
