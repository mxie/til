require 'spec_helper'

feature 'User views users page' do
  scenario 'and can see a list of all users' do
    signed_in_user
    create_list(:user, 5)

    visit users_path

    User.all.each do |user|
      page.should have_selector('td', text: user.display_name)
    end
  end
end
