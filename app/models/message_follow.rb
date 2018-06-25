class MessageFollow < ActiveRecord::Base
      validates_uniqueness_of :message_followee_id, scope: :message_follower_id

end
