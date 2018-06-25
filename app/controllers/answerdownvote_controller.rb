class AnswerdownvoteController < ApplicationController

before_action :authenticate_user!


	def toggle_answer_downvote
		
		@answer = Answer.find(params[:answer_id])
		user_email = params[:user_email]
        current_user_email = current_user.email
        user_profileimage = params[:user_profileimage]
        Verification.answer_downvotes_email(user_email,user_profileimage,current_user_email).deliver_now

 
		downvote = Answerdownvote.where(user_id: current_user.id, answer_id: @answer.id).first
		upvote = Upvote.where(user_id: current_user.id, answer_id: @answer.id).first
		if downvote
		    downvote.destroy	
		else
			if upvote
				upvote.destroy
			end	
			Answerdownvote.create(user_id: current_user.id, answer_id: @answer.id)
		end

		# respond_to do |format|
		# 	format.js {}
		# end
		 redirect_to:back
		
	end


end
