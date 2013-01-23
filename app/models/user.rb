class User < ActiveRecord::Base
  include Clearance::User
  attr_accessible :name, :email, :password

  def display_name
    name || email
  end
end
