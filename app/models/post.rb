class Post < ApplicationRecord
  acts_as_taggable_on :tags
  self.per_page = 10
end
