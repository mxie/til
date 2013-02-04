require 'spec_helper'

feature 'User clicks on a navigation tab' do
  background do
    signed_in_user
  end

  scenario 'and the the appropriate tab is active depending on the page' do
    click_link 'Home'

    page.should have_selector('li.active', text: 'Home')

    click_link 'People'

    page.should have_selector('li.active', text: 'People')
  end
end
