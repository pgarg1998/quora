class Message < ActiveRecord::Base
	belongs_to :user
	validates  :content, presence: true,length: {maximum: 140}
	# has_many   :message_upvotes
	has_many   :messagedownvotes, :dependent => :destroy
  has_many   :answers, :dependent => :destroy
  has_many   :messagecomments, :dependent => :destroy
  has_many   :message_upvotes, :dependent => :destroy


	# def upvoted_by user_id
 #  	MessageUpvote.where(user_id: user_id, message_id:id).length > 0
 #  end


 #  def message_upvote_string user_id
 #  	if upvoted_by user_id
 #  		return "upvoted"
 #  	else
 #  		return "Upvote"
 #  	end
 #  end
def self.search(search)
  Message.where("content LIKE ?", "%#{search}%") ||  User.where("firstname LIKE ?", "%#{search}%")
  # User.where("content LIKE ?", "%#{search}%")
end

	def downvoted_by user_id
  	Messagedownvote.where(user_id: user_id, message_id:id).length > 0
  end


  def message_downvote_string user_id
  	if downvoted_by user_id
  		return "Downvoted"
  	else
  		return "Downvote"
  	end
  end

  def toggle messagefollowee_id,messagefollower_id
         toggle = MessageFollow.where(message_follower_id: messagefollower_id, message_followee_id: messagefollowee_id).first
         return toggle
       end


      def messagefollowingbutton messagefollowee_id,messagefollower_id
        if toggle messagefollowee_id,messagefollower_id
           return "Following"
         else
           return "Follow"
        end   
      end
def follow user_id,id
     follow1 = FollowMapping.where(:followee_id => user_id, :follower_id =>id).first
     return follow1
  end 

  def can_follow user_id,id
    if follow user_id,id
      return 1
     else
      return 0 
    end  
  end    


end

