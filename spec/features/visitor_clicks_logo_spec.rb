require 'spec_helper'

feature 'Visitor clicks the logo' do
  scenario 'and is taken to the home page' do
    visit sign_up_path
    click_link 'Today I Learned'

    page.should have_content I18n.t('layouts.application.sign_in')
  end
end
