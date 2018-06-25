class Messagecomment < ActiveRecord::Base
  belongs_to :user
  belongs_to :message
  validates  :content, presence: true
  has_many   :commentupvotes, :dependent => :destroy
  has_many   :commentdownvotes, :dependent => :destroy



  def commented_by user_id
  	Commentupvote.where(user_id: user_id, messagecomment_id:id).length > 0
  end

  def message_comment_string user_id
  	if commented_by user_id
  		return "Upvoted"
  	else
  		return "Upvote"
  	end
  end

   def commented_by1 user_id
    Commentdownvote.where(user_id: user_id, messagecomment_id:id).length > 0
  end

  def message_comment_string1 user_id
    if commented_by1 user_id
      return "Downvoted"
    else
      return "Downvote"
    end
  end

end
