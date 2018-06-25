class AddFieldsToanswer < ActiveRecord::Migration
  def change

 add_column :answers, :content ,:string
 add_foreign_key :answers, :user_id
 
  end
end