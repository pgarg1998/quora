class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :updat1, :destro1]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end


  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json``
  def create
    content = params[:content]
    message_id = params[:message_id]
    Answer.create(content: content, user_id: current_user.id ,message_id: message_id)
    # return redirect_to controller: :home, action: :index  
    redirect_to:back
    # @answer = Answer.new(answer_params)

    # respond_to do |format|
    #   if @answer.save
    #     format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
    #     format.json { render :show, status: :created, location: @answer }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @answer.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def updat1
    aid = params[:id]
    ans = params[:Answer]
   Answer.find(aid).update(content: ans)
  return redirect_to controller: :home, action: :Profiles 
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destro1
   aid = Answer.find(params[:id])
   aid.destroy
  return redirect_to controller: :home, action: :Profiles
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.fetch(:answer, {})
    end
end
