class LikesController < ApplicationController
	def new
		@like = Like.new		
	end

	def index
		@likes = Like.all
	end

	def create
		@photo = Photo.find(params[:photo_id])
		@like = Like.new
		@like.photo_id = @photo.id
		@like.user_id = current_user.id
			
		 if @like.save
			redirect_to photo_path(@photo)
		else 
			flash[:error] = "can't save!"
		end
		
	end


	  def destroy
	    @photo = Photo.find(params[:photo_id])
	    @like = like.find(params[:id])
	    @like.destroy

	   	redirect_to photo_path(@photo)
	   
	  end

	  private

	  def like_params
	  	params.require(:like).permit(:photo_id, :user_id)
	  end
end
