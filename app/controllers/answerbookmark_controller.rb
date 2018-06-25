class AnswerbookmarkController < ApplicationController
	before_action :authenticate_user!
    

    def createbookmark
      ans = params[:answer_id]
      bookmark = Answerbookmark.where(answers_id:ans, user_id: current_user.id).first
      if bookmark
         bookmark.destroy
      else
         Answerbookmark.create(answers_id:ans, user_id: current_user.id).save
      end 
      redirect_to :back 
    end
    
    def remove
      id = params[:id]
      Answerbookmark.where(id: id).first.destroy
      redirect_to :back
    end


end
