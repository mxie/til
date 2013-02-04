require 'spec_helper'

feature 'User views tags page' do
  scenario 'and sees each post associated with a user' do
    signed_in_user
    create(:post, tag_list: 'test tag')
    create(:post, tag_list: 'another, test tag')

    visit tags_path

    Post.tag_counts.each do |tag_item|
      page.should have_content(tag_item.name)
    end
  end
end
