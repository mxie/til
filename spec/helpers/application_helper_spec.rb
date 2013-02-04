require 'spec_helper'

describe ApplicationHelper do
  describe 'tab_class' do
    it 'returns active if the current page matches a controller' do
      self.stubs(current_page?: true)

      expect(tab_class('users')).to eq('active')
    end

    it 'returns an empty string if the current page does not match a controller' do
      self.stubs(current_page?: false)

      expect(tab_class('posts')).to eq('')
    end
  end

  describe 'nav_tab' do
    it 'returns a link wrapped as a list item with an active class' do
      self.stubs(current_page?: true)

      tag = nav_tab(controller: 'users', text: 'Users')

      expect(tag).to have_selector('li.active a', text: 'Users')
    end

    it 'returns a link wrapped as a list item with an empty class' do
      self.stubs(current_page?: false)

      tag = nav_tab(controller: 'users', text: 'Users')

      expect(tag).to have_selector('li a', text: 'Users')
    end
  end
end
