class ProfilesController < ApplicationController
  def index
  end

  def show
    @id = User.find(params[:id])
  end

end
