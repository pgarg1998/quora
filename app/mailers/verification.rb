class Verification < ApplicationMailer
	default :from => 'piyush.garg190@gmail.com'

	def follow_email email,image,current_user_email
      @email = email
      @image = image
      @current_user_email = current_user_email
      mail(to: email, subject: 'Welcome to My Awesome Site')
	end

	def unfollow_email email,image,current_user_email
      @email = email
      @image = image
      @current_user_email = current_user_email
      mail(to: email, subject: 'Welcome to My Awesome Site')
	end

    def answer_upvotes_email email,image,current_user_email
      @email = email
      @image = image
      @current_user_email = current_user_email
      mail(to: email, subject: 'Welcome to My Awesome Site')
    end
    
    def answer_downvotes_email email,image,current_user_email
      @email = email
      @image = image
      @current_user_email = current_user_email
      mail(to: email, subject: 'Welcome to My Awesome Site')
    end
    
    # def message_upvotes_email email,image,current_user_email
    #   @email = email
    #   @image = image
    #   @current_user_email = current_user_email
    #   mail(to: email, subject: 'Welcome to My Awesome Site')
    # end
    
    # def message_downvotes_email email,image,current_user_email
    #   @email = email
    #   @image = image
    #   @current_user_email = current_user_email
    #   mail(to: email, subject: 'Welcome to My Awesome Site')
    # end
    
end
