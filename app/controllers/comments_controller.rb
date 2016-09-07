class CommentsController < ApplicationController
	def new
		@comment = Comment.new		
	end

	def index
		@comments = Comment.all
	end

	def create
		@photo = Photo.find(params[:photo_id])
		@comment = @photo.comments.build(comment_params)
		 if @comment.save
			redirect_to photo_path(@photo)
		else 
			flash[:error] = "can't save!"
		end
		
	end


	  def destroy
	    @photo = Photo.find(params[:photo_id])
	    @comment = Comment.find(params[:id])
	    @comment.destroy

	   	redirect_to photo_path(@photo)
	   
	  end

	  private

	  def comment_params
	  	params.require(:comment).permit(:body, :photo_id, :user_id)
	  end
end
