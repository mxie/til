class User < ActiveRecord::Base
  include Clearance::User
  DEFAULT_PICTURE_SIZE = 50

  attr_accessible :name, :email, :password

  has_many :posts

  def display_name
    name.presence || email
  end
end
