class PagesController < ApplicationController
  def index
  	@users = User.all
    
  end

  def show
  	@user = User.find(params[:id])
  end

  private

  def page_params
  	params.require(:pages).permit(:id, :user_id)
  end
end
