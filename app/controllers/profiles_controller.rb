class ProfilesController < ApplicationController
  def index
  end

  def show
    @id = User.find(params[:id])
  end


  # private
  # def article_params
  #   params.require(:user).permit(:id)
  # end
end
