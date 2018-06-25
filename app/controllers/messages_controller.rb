class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :updat, :destro]
  

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
    @answer = Answer.all
    @messagefollow = MessageFollow.all
    @messagecomments = Messagecomment.all
    @upvotes = Upvote.all
    @follow = FollowMapping.all 
    @users = User.all
    @bookmark = Answerbookmark.all

      if params[:search]
        @messages = Message.search(params[:search]).order("created_at DESC")
      else
        @messages = Message.all.order("created_at DESC")
      end

  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  @answer = Answer.all
  @messagefollow = MessageFollow.all
  @messagecomments = Messagecomment.all
  @upvotes = Upvote.all
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
   
    content = params[:content]
    Message.create(content: content, user_id: current_user.id)
    return redirect_to controller: :home, action: :index  

    # @message = Message.new(message_params)

    # respond_to do |format|
    #   if @message.save
    #     format.html { redirect_to @message, notice: 'Message was successfully created.' }
    #     format.json { render :show, status: :created, location: @message }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @message.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def updat
    mid = params[:id]
    ques = params[:Question]
    Message.find(mid).update(content: ques)
    redirect_to:back  
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destro
   mid = params[:id]
   Message.find(mid).destroy
   # a = Answer.where(message_id: mid)
   # a.destroy
   redirect_to:back  
  end

  #   def messagefollow
  #   messagefollowee_id = params[:messagefollowee_id]
  #   if current_user.can_follow messagefollowee_id
  #     Messagefollowmapping.create(:messagefollowee_id => messagefollowee_id, :messagefollower_id => current_user.id).save
      
  #     # Verification.follow_email(user_email,user_profileimage,current_user_email).deliver_now
  #   end
  #   return redirect_to '/'
  # end

  # def messageun_follow
  #   messagefollowee_id = params[:messagefollowee_id]
  #     if current_user.can_un_follow messagefollowee_id
  #     Messagefollowmapping.where(:messagefollowee_id => messagefollowee_id, :messagefollower_id => current_user.id).first.destroy
  #     # Verification.unfollow_email(user_email,user_profileimage,current_user_email).deliver_now

  #   end
  #   return redirect_to '/'
  # end

  def toggle_message_following_button 
     messagefollowee_id = params[:message_followee_id]
     messagefollower_id = current_user.id
     @msg = params[:message_followee_id]
     follow = MessageFollow.where(message_followee_id: messagefollowee_id, message_follower_id: messagefollower_id).first
     @followings = false
     if follow
        
        follow.destroy
      else
        MessageFollow.create(message_followee_id: messagefollowee_id, message_follower_id: messagefollower_id).save      
        @followings = true
     end
   end
   
   # def toggle_message_follower_button 
   #   messagefollowee_id = params[:messagefollowee_id]
   #   messagefollower_id = params[:messagefollower_id]
   #   follow = Messagefollowmapping.where(messagefollowee_id: messagefollower_id, messagefollower_id: messagefollowee_id).first
     
   #   if follow
   #      follow.destroy
   #    else
   #       Messagefollowmapping.create(messagefollowee_id: messagefollower_id, messagefollower_id: messagefollowee_id)         
   #   end
   #   return redirect_to '/'
   # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.fetch(:message, {})
    end


end
