class CommentsController < ApplicationController
		def new
		@comment = Comment.new		
	end

	def index
		@comments = Comment.all
	end

	def create
		@photo = Photo.find(params[:photo_id])
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		@comment.photo_id = params[:photo_id]

		if @comment.save
		

			redirect_to root_path
		else 
			flash[:error] = "can't save!"
		end
		
	end


	  def destroy
	    @photo = Photo.find(params[:photo_id])
	    @comment = Comment.find(params[:id])
	    @comment.destroy

	   	redirect_to root_path
	   
	  end

	  private

	  def comment_params
	  	params.require(:comment).permit(:body, :photo_id, :user_id)
	  end
end
