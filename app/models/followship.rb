class Followship < ActiveRecord::Base
	belongs_to :user
	belongs_to :follower, :class_name => "User", :foreign_key => "followed_id" 
end
