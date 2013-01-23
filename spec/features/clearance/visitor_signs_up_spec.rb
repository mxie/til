require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'First Last', 'valid@example.com', 'password'

    user_should_be_signed_in
  end

  scenario 'tries with invalid email' do
    sign_up_with '', 'invalid_email', 'password'

    user_should_be_signed_out
  end

  scenario 'tries with blank password' do
    sign_up_with '', 'valid@example.com', ''

    user_should_be_signed_out
  end

  scenario 'and sees a different landing page' do
    visit root_path

    page.should_not have_xpath('//textarea[@placeholder="Lesson"]')

    sign_up_with '', 'user@example.com', 'foobar'

    page.should have_xpath('//textarea[@placeholder="Lesson"]')
  end
end
