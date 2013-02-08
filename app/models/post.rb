class Post < ActiveRecord::Base
  DEFAULT_PER_PAGE = 10

  acts_as_ordered_taggable

  validates :lesson, presence: true
  validates :user_id, presence: true

  belongs_to :user

  default_scope order: 'posts.created_at DESC'

  self.per_page = DEFAULT_PER_PAGE
end
