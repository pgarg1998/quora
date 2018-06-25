class DescriptionTousers < ActiveRecord::Migration
  def change
  	add_column :users, :Description, :string
  end
end
