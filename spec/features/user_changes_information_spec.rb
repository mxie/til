require 'spec_helper'

feature 'User changes information' do
  scenario 'and it should be reflected right after submission' do
    user = create(:user, name: 'Original Name')
    sign_in_with(user.email, user.password)

    visit edit_user_path(user)

    fill_in I18n.t('settings.name'), with: 'New Name'
    click_button I18n.t('settings.submit')
    user.reload

    page.should have_content('New Name')
  end
end
