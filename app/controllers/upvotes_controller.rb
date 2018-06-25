class UpvotesController < ApplicationController
before_action :authenticate_user!


	def toggle_answer_upvote
		
		@answer = params[:answer_id]
		# user_email = params[:user_email]
  #       current_user_email = current_user.email
  #       user_profileimage = params[:user_profileimage]
  #       Verification.answer_upvotes_email(user_email,user_profileimage,current_user_email).deliver_now 
		upvote = Upvote.where(user_id: current_user.id, answer_id: @answer).first
		downvote = Answerdownvote.where(user_id: current_user.id, answer_id: @answer).first
		@upvote_toogle = false
		if upvote
			upvote.destroy
		else
			Upvote.create(user_id: current_user.id, answer_id: @answer)	
		    @upvote_toogle = true
		    if downvote
		    	downvote.destroy
		    end	
		end

		# respond_to do |format|
		# 	format.js {}
		# end
		 redirect_to:back
		
	end


end
