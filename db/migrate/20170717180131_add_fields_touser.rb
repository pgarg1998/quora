class AddFieldsTouser < ActiveRecord::Migration
  def change

  add_column :users, :profile_picture ,:string
  
  end
end
