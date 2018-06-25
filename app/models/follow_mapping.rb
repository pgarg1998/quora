class FollowMapping < ActiveRecord::Base
      validates_uniqueness_of :followee_id, scope: :follower_id

       
       def toggle follower_id
         toggle = FollowMapping.where(follower_id: follower_id).first
         return toggle
       end


      def followingbutton follower_id
        if toggle follower_id
           return "Following"
         else

        end   
      end

      def follow_toggle followee_id,follower_id
         follow_toggle = FollowMapping.where(followee_id: follower_id, follower_id: followee_id).first
         return follow_toggle
       end

      def followerbutton followee_id,follower_id
         if follow_toggle followee_id,follower_id
           return "Following"
         else
           return "Follow"
         end   
      end
          

end

