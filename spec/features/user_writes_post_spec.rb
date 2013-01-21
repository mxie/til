require 'spec_helper'

feature 'User writes post' do
  background do
    signed_in_user
  end

  scenario 'and sees the post they just wrote' do
    fill_in 'Lesson', with: 'Cool things'
    click_button 'Create Post'

    page.should have_content('Cool things')
    page.should_not have_content('tags:')
  end

  scenario 'and sees the post they just wrote with a tag' do
    fill_in 'Lesson', with: 'Cool things'
    fill_in 'tags', with: 'vague'
    click_button 'Create Post'

    page.should have_content('Cool things')
    page.should have_content('vague')
  end

  scenario 'and sees the post they just wrote with multiple tags' do
    fill_in 'Lesson', with: 'Cool things'
    fill_in 'tags', with: 'vague, random'
    click_button 'Create Post'

    page.should have_content('Cool things')
    page.should have_content('vague')
    page.should have_content('random')
  end

  scenario 'and sees how much time has passed since they wrote the post' do
    old_time = Time.parse('12:00')
    new_time = Time.parse('12:02')

    Timecop.freeze(old_time)

    fill_in 'Lesson', with: 'Cool things'
    click_button 'Create Post'

    Timecop.return
    Timecop.travel(new_time)

    visit root_path

    page.should have_content('Cool things')
    page.should_not have_content('tags:')
    page.should have_content('2 minutes ago')
  end
end
