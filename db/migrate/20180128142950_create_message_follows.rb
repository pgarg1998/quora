class CreateMessageFollows < ActiveRecord::Migration
  def change
    create_table :message_follows do |t|
      t.integer :message_follower_id
      t.integer :message_followee_id

      t.timestamps null: false
    end
  end
end
