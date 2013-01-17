require 'spec_helper'

feature 'User writes post' do
  scenario 'and sees the post they just wrote' do
    signed_in_user

    fill_in 'Lesson', with: 'Cool things'
    click_button 'Create Post'

    page.should have_content('Cool things')
  end
end
