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

  scenario 'and the posts are paginated' do
    signed_in_user
    create_list(:post, Post::DEFAULT_PER_PAGE + 1)
    expected_post = Post.first
    unexpected_post = Post.last

    visit posts_path

    page.should have_selector('li', text: expected_post.lesson)
    page.should_not have_selector('li', text: unexpected_post.lesson)
  end
end
