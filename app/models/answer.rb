class Answer < ActiveRecord::Base
	
  belongs_to :user
  validates :content, presence: true
  has_many :upvotes, :dependent => :destroy
  has_many :answerdownvotes, :dependent => :destroy
  has_many :answerbookmarks, foreign_key: :answers_id, dependent: :destroy




  def upvoted_by user_id
  	upvote = Upvote.where(answer_id: id, user_id: user_id).length > 0
    return upvote
  end


  def upvote_string user_id
  	if upvoted_by user_id
  		return 0
  	else
  		return 1
  	end
  end


  def downvoted_by user_id
    Answerdownvote.where(answer_id: id, user_id: user_id).length > 0
  end


  def downvote_string user_id
    if downvoted_by user_id
      return "Downvoted"
    else
      return "Downvote"
    end

  end

  def downvoted_by1 user_id
    ans = Answerdownvote.where(answer_id: id, user_id: user_id).length > 0
    return ans 
  end


  def downvote_string1 user_id
    if downvoted_by1 user_id
      return 0
    else
      return 1
    end

  end

  def bookmarked_by ans_id,user_id
    Answerbookmark.where(answers_id: ans_id, user_id: user_id).length > 0
  end


  def answer_bookmark ans_id,user_id
    if bookmarked_by ans_id,user_id
      return 0
    else
      return 1
    end

  end


end
