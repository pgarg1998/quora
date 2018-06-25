class AdduserIdTomessagecomments < ActiveRecord::Migration
  def change
  	  	add_reference :messagecomments, :user, index: true

  end
end
