require 'spec_helper'

describe User do
  describe '#display_name' do
    it 'should return the name of the user if it is available' do
      user = create(:user)

      expect(user.display_name).to eq(user.name)
    end

    it 'should return the email of the user if the name is not available' do
      user = create(:user, name: nil)

      expect(user.display_name).to eq(user.email)
    end
  end
end
