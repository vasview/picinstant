class PagesController < ApplicationController
  def index
    @photos = Photo.paginate(:page => params[:page], :per_page => 4)
    @photo_total = @photos.count
    
  	@users = User.all
    
    if user_signed_in? && current_user.followships.present?
      @followships = current_user.followships
    end 

    @users.each
  end

  def show
  	@user = User.find(params[:id])
  end

  private

  def page_params
  	params.require(:pages).permit(:id, :user_id)
  end
end
