class Commentupvote < ActiveRecord::Base
  belongs_to :user
  belongs_to :messagecomment
end
