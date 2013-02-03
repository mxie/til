class User < ActiveRecord::Base
  include Clearance::User
  attr_accessible :name, :email, :password

  has_many :posts

  def display_name
    name.presence || email
  end
end
