class Post < ActiveRecord::Base
  acts_as_ordered_taggable
end
