require 'spec_helper'

feature 'User changes information' do
  scenario 'and it should be reflected right after submission' do
    user = signed_in_user
    new_name = 'First Last'

    visit edit_user_path(user)

    fill_in I18n.t('settings.name'), with: new_name
    click_button I18n.t('settings.submit')
    user.reload

    page.should have_content(new_name)
  end
end
