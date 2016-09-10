class PhotosController < ApplicationController
  def index
  	@photos = Photo.all
  	
  end

  def show
  	@photo = Photo.find(params[:id])
    @like = @photo.likes.find_by(user_id: current_user.id)

  end

  def new
  	@photo = Photo.new
  end

  def create
  	@photo = current_user.photos.build(photo_params)

  	if @photo.save 
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@photo = Photo.find(params[:id])
  	
  end

  def update
  	@photo = Photo.find(params[:id])

  	if @photo.update(photo_params)
      flash[:success] = "Photo was successfully created!"
  		redirect_to photos_path
  	else
      flash[:danger] = "There was a probmem with updating your."
  		render 'edit'
  	end
  end

  def destroy
  	@photo = Photo.destroy(params[:id])
  	redirect_to photos_path
  end

  private

  def photo_params
  	params.require(:photo).permit(:title, :description, :user_id, :image)
  end
end
