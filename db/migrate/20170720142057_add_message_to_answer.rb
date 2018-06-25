class AddMessageToAnswer < ActiveRecord::Migration
  def change
  	add_reference :answers, :message, index: true
  end
end
