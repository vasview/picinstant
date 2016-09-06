class PagesController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@photo = Photo.find(params[:id])
  end
end
