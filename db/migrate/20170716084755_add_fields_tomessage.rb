class AddFieldsTomessage < ActiveRecord::Migration
  
  def change
  add_column :messages, :content ,:string
   add_foreign_key :messages, :user_id
  end
end
