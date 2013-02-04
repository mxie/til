class Post < ActiveRecord::Base
  acts_as_ordered_taggable

  validates :lesson, presence: true
  validates :user_id, presence: true

  belongs_to :user

  default_scope order: 'posts.created_at DESC'
end
