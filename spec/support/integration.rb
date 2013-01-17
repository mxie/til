RSpec.configure do |config|
  config.include Integration::ClearanceHelpers, :type => :feature
  config.include Integration::ActionMailerHelpers, :type => :feature
end
