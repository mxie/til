require 'spec_helper'

feature 'User clicks on a navigation tab' do
  background do
    signed_in_user
  end

  scenario 'and the the appropriate tab is active depending on the page' do
    posts_link.click

    verify_link_is_active(posts_link)

    users_link.click

    verify_link_is_active(users_link)
  end

  def nav_link(link_text)
    all('a', text: link_text).first
  end

  def posts_link
    nav_link(I18n.t('navigation.posts'))
  end

  def users_link
    nav_link(I18n.t('navigation.users'))
  end

  def verify_link_is_active(link)
    link.parent.has_css?('li.active')
  end
end
