class CreateMessagecomments < ActiveRecord::Migration
  def change
    create_table :messagecomments do |t|

      t.timestamps null: false
    end
  end
end
