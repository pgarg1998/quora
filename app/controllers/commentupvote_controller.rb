class CommentupvoteController < ApplicationController
    before_action :authenticate_user!
def toggle_comment_upvote
		
		comment = Messagecomment.find(params[:comment_id])
		@comm = params[:comment_id]
 
		comment_upvote = Commentupvote.where(user_id: current_user.id, messagecomment_id: comment.id).first
		comment_downvote = Commentdownvote.where(user_id: current_user.id, messagecomment_id: comment.id).first
        @commentupvote =false
		if comment_upvote  		
			comment_upvote.destroy
		else
			Commentupvote.create(user_id: current_user.id, messagecomment_id: comment.id).save
			@commentupvote=true
			if comment_downvote
			  	comment_downvote.destroy
			end  	
		end
		# respond_to do |format|
		# 	format.js {}
		# end
		 
	end
	     


end
