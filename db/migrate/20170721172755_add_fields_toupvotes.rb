class AddFieldsToupvotes < ActiveRecord::Migration
  def change

     	add_reference :upvotes, :answer, index: true
     	add_reference :upvotes, :user, index: true


  end
end
