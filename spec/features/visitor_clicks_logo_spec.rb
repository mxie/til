require 'spec_helper'

feature 'Visitor clicks the logo' do
  scenario 'and is taken to the home page' do
    visit sign_up_path
    click_link 'Today I Learned'

    user_should_be_signed_out
  end
end
