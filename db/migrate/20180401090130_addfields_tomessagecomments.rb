class AddfieldsTomessagecomments < ActiveRecord::Migration
  def change
  	add_reference :messagecomments, :message, index: true
  	add_column :messagecomments, :content, :string
  end
end
