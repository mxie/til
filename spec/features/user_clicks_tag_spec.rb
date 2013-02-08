require 'spec_helper'

feature 'User clicks on a tag' do
  background do
    signed_in_user
  end

  scenario 'and is shown all the posts associated with that tag' do
    posts = create_list(:tagged_post, 2)
    expected_post = posts.first
    unexpected_post = posts.last
    tag = expected_post.tags.first

    visit posts_path
    within('section') do
      click_link tag.name
    end

    page.should have_content(expected_post.lesson)
    page.should_not have_content(unexpected_post.lesson)
  end
end
