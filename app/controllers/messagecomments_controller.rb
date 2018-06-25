class MessagecommentsController < ApplicationController
	before_action :authenticate_user!

def createcomment
	content = params[:content]
	id = params[:message_id]
	Messagecomment.create(content: content, message_id:id, user_id: current_user.id).save
	redirect_to:back  
end


end
