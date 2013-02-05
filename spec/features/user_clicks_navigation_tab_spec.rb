require 'spec_helper'

feature 'User clicks on a navigation tab' do
  background do
    signed_in_user
  end

  scenario 'and the the appropriate tab is active depending on the page' do
    click_link I18n.t('navigation.posts')

    page.should have_selector('li.active', text: I18n.t('navigation.posts'))

    click_link I18n.t('navigation.users')

    page.should have_selector('li.active', text: I18n.t('navigation.users'))
  end
end
