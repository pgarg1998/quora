class CommentdownvoteController < ApplicationController
	    before_action :authenticate_user!

	def toggle_comment_downvote
		
		comment = Messagecomment.find(params[:comment_id])
		@comm = params[:comment_id]
        
		comment_downvote = Commentdownvote.where(user_id: current_user.id, messagecomment_id: comment.id).first
    	comment_upvote = Commentupvote.where(user_id: current_user.id, messagecomment_id: comment.id).first

        @commentdownvote =false
		if comment_downvote  
			comment_downvote.destroy
		else
			Commentdownvote.create(user_id: current_user.id, messagecomment_id: comment.id).save
			@commentdownvote=true			
		    if comment_upvote
			  	comment_upvote.destroy
			end  	

		end
		# respond_to do |format|
		# 	format.js {}
		# end
		 
	end
	     
end
