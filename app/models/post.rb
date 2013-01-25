class Post < ActiveRecord::Base
  acts_as_ordered_taggable

  validates :lesson, presence: true
end
