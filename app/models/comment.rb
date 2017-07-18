class Comment < ApplicationRecord
  #attr_accessible :body, :user_id, :commentable_id, :commentable_type
    belongs_to :user
    belongs_to :commentable, polymorphic: true

end
