class ProfileCredentialTousers < ActiveRecord::Migration
  def change
  	  	add_column :users, :ProfileCredential, :string
  end
end
