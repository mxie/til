require 'spec_helper'

feature 'User views users page' do
  scenario 'and can see a list of all users' do
    signed_in_user
    generate_users

    click_link 'People'

    User.all.each do |user|
      page.should have_selector('td', text: user.display_name)
    end
  end

  def generate_users
    5.times { create(:user) }
  end
end
