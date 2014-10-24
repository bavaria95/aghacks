class ProfilesController < ApplicationController
  def index
  	@user = User.find(params[:id])
  end

  def show
  	@identificator = User.find(params[:id])
  end


  # private
  # def article_params
  #   params.require(:user).permit(:id)
  # end
end
