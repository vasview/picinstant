class FollowshipsController < ApplicationController

	def index
		@followships = current_user.followships
		@back_followships = current_user.back_followships
		
	end

	def create
		@followship = current_user.followships.build(follower_id: params[:follower_id])
		if @followship.save
			flash[:notice] = "Successfully subscribed to follow"
			redirect_to root_url
		else
			flash[:error] = "Unable to subscribe to follow"
			redirect_to root_url
		end
	end

	def destroy
		@followship = current_user.followships.find(params[:id])
		@followship.destroy
		flash[:notice] = "Unsubscribed from following"
		redirect_to followships_path
	end

	private

	def followship_params
		params.require(:followship).permit(:id, :follower_id, :user_id)
	end
end
