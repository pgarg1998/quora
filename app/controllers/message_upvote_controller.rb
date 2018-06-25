class MessageUpvoteController < ApplicationController

before_action :authenticate_user!


	# def toggle_message_upvote
		
	# 	@message = Message.find(params[:message_id])
	# 	#line 10 is for toggle upvote button without reloading for more: open toggle_message_upvote.js.erb
	# 	@msg = params[:message_id]
	# 	@mu_count = params[:mu_count]
	#     @md_count = params[:md_count]
 #        @mui_count = params[:mu_count]
	#     @mdi_count = params[:md_count]
 #        @mud_count = params[:mu_count]
	#     @mdd_count = params[:md_count]
		
	# 	user_email = params[:user_email]
 #        current_user_email = current_user.email
 #        user_profileimage = params[:user_profileimage]
 #        Verification.message_upvotes_email(user_email,user_profileimage,current_user_email).deliver_now
 
	# 	message_upvote = MessageUpvote.where(user_id: current_user.id, message_id: @message.id).first
	# 	messagedownvote = Messagedownvote.where(user_id: current_user.id, message_id: @message.id).first
	# 	@messageupvote = false
	# 	@messagedownvote=false
	# 	@message_upvote_count=false
	# 	@message_downvote_count=false
	# 	if message_upvote
	# 		# @message_upvote_count=false
	# 		# @mu_count = @mu_count.to_i-1
	# 		message_upvote.destroy
	# 	else
	# 		MessageUpvote.create(user_id: current_user.id, message_id: @message.id)
	# 		@messageupvote = true
	# 		@message_upvote_count=true
	# 		# @mu_count = @mu_count.to_i+1
	# 		if messagedownvote
	# 			@message_downvote_count=true
	# 			# @md_count = @md_count.to_i-1
	# 			@messagedownvote=false
	# 			messagedownvote.destroy
	# 		end	
	# 	end

	# 	# respond_to do |format|
	# 	# 	format.js {}
	# 	# end
		 
		
	# end


end
