require 'spec_helper'

describe User do
  describe '#display_name' do
    it 'returns the name of the user if it is available' do
      user = build(:user, name: 'Some Name', email: 'user@example.com')

      expect(user.display_name).to eq(user.name)
    end

    it 'returns the email of the user if the name is not available' do
      user = build(:user, name: nil, email: 'user@example.com')

      expect(user.display_name).to eq(user.email)
    end
  end
end
