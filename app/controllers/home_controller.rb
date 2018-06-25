class HomeController < ApplicationController
    before_action :authenticate_user!

def index
	@message = Message.all
	@answer = Answer.all
  @messagefollow = MessageFollow.all
end

def questions_api

       ques = params[:term]
       user = params[:term]
       a = Message.where("content LIKE ?", "%#{ques}%")
       u = User.where("firstname LIKE ?", "%#{user}%")
       arr=[]
       a.each do|m|

        h= {:value => m.content, :id => m.id, :label => m.content } 
         # pushing hash in array
         arr <<h
         
       end
       u.each do|r|
         h= {:value => r.firstname, :id => r.id, :label => r.firstname } 
         # pushing hash in array
         arr <<h
       end

       render :json => arr  
end

  

 # def upload_image
 #  	uploaded_file = params[:image_tag]
  	
 #  	filename = SecureRandom.hex + "." +uploaded_file.original_filename.split('.')[1]
 #  	filepath = Dir.pwd + "/public/uploads/" + filename
 #  	File.open(filepath,'wb') do |file|
	# 	file.write(uploaded_file.read())
	# end
	# current_user.profile_picture = filename
	# current_user.save!
 #  	return redirect_to '/profile'
 #  end

 def profile
  end

 def credential
  content = params[:content]
  user = User.find(current_user.id)
  user.update(ProfileCredential: content)  
 redirect_to :back
 end

 def Description
  content = params[:content]
  user = User.find(current_user.id)
  user.update(Description: content)
  redirect_to :back  
 end

 def firstname_lastname_update
  firstname = params[:Firstname]
  lastname = params[:Lastname]
  birthday = params[:birthday]
  user = User.find(current_user.id)
  user.update(firstname: firstname, lastname: lastname, birthday: birthday)  
  #user image code below 
  uploaded_file = params[:image_tag]
        filename = SecureRandom.hex + "." +uploaded_file.original_filename.split('.')[1]
        filepath = Dir.pwd + "/public/uploads/" + filename
        File.open(filepath,'wb') do |file|
          file.write(uploaded_file.read())
        end
        current_user.profile_picture = filename
        current_user.save!
      redirect_to:back
 end 

 def Profiles
  @follow = FollowMapping.all 
  @message = Message.all
  @answer = Answer.all
  @messagefollow = MessageFollow.all
  @upvote = Upvote.all
  @bookmark = Answerbookmark.all

  end 

  def yourquestions
  @message = Message.all
  @answer = Answer.all
  @messagefollow = MessageFollow.all

  end


def My_answers
  @message = Message.all
  @answer = Answer.all
  end
  def users
    @users = User.all
  end

  def follow

  	@followee_id = params[:followee_id]
    user_email = params[:user_email]
    current_user_email = current_user.email
    user_profileimage = params[:user_profileimage]
    follow1 = FollowMapping.where(:followee_id => @followee_id, :follower_id => current_user.id).first  
    @fo = false
    if follow1
      follow1.destroy 
      Verification.unfollow_email(user_email,user_profileimage,current_user_email).deliver_now
    else
      FollowMapping.create(:followee_id => @followee_id, :follower_id => current_user.id).save     
      Verification.follow_email(user_email,user_profileimage,current_user_email).deliver_now 
      @fo = true
    end

  	# if current_user.can_follow @followee_id
  	# 	FollowMapping.create(:followee_id => @followee_id, :follower_id => current_user.id).save
      
   #    Verification.follow_email(user_email,user_profileimage,current_user_email).deliver_now
  	# end
        redirect_to '/'
  end

  def un_follow

  	@followee_id = params[:followee_id]
    user_email = params[:user_email]
    current_user_email = current_user.email
    user_profileimage = params[:user_profileimage]
  	unfollow1 = FollowMapping.where(:followee_id => @followee_id, :follower_id => current_user.id).first  
    @unfo = false
    if unfollow1
      unfollow1.destroy
      Verification.unfollow_email(user_email,user_profileimage,current_user_email).deliver_now        
    else
      FollowMapping.create(:followee_id => @followee_id, :follower_id => current_user.id).save
      Verification.follow_email(user_email,user_profileimage,current_user_email).deliver_now 
          @unfo = true
    end 
    redirect_to '/' 	
  end

    def follow1

    @followee_id = params[:followee_id]
    user_email = params[:user_email]
    current_user_email = current_user.email
    user_profileimage = params[:user_profileimage]
    follow1 = FollowMapping.where(:followee_id => @followee_id, :follower_id => current_user.id).first  
    @fo = false
    if follow1
      follow1.destroy 
      Verification.unfollow_email(user_email,user_profileimage,current_user_email).deliver_now
    else
      FollowMapping.create(:followee_id => @followee_id, :follower_id => current_user.id).save     
      Verification.follow_email(user_email,user_profileimage,current_user_email).deliver_now 
      @fo = true
    end

    # if current_user.can_follow @followee_id
    #   FollowMapping.create(:followee_id => @followee_id, :follower_id => current_user.id).save
      
   #    Verification.follow_email(user_email,user_profileimage,current_user_email).deliver_now
    # end
        redirect_to:back
  end

  def un_follow1

    @followee_id = params[:followee_id]
    user_email = params[:user_email]
    current_user_email = current_user.email
    user_profileimage = params[:user_profileimage]
    unfollow1 = FollowMapping.where(:followee_id => @followee_id, :follower_id => current_user.id).first  
    @unfo = false
    if unfollow1
      unfollow1.destroy
      Verification.unfollow_email(user_email,user_profileimage,current_user_email).deliver_now        
    else
      FollowMapping.create(:followee_id => @followee_id, :follower_id => current_user.id).save
      Verification.follow_email(user_email,user_profileimage,current_user_email).deliver_now 
          @unfo = true
    end 
    redirect_to:back   
  end


def toggle_following_button 
     @followee_id = params[:followee_id]
     follower_id = params[:follower_id]
     follow = FollowMapping.where(followee_id: @followee_id, follower_id: follower_id).first
     @following=false
     if follow
        @following=true
        follow.destroy
      else
        
     end
   end
   
   def toggle_follower_button 
     followee_id = params[:followee_id]
     @follower_id = params[:follower_id]
     follow = FollowMapping.where(followee_id: @follower_id, follower_id: followee_id).first
     @followed = false
     if follow
        follow.destroy
      else
         FollowMapping.create(followee_id: @follower_id, follower_id: followee_id)
         @followed=true     
     end
   end
end