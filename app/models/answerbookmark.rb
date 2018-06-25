class Answerbookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer, class_name: "Answer", foreign_key: 'answers_id'
end
