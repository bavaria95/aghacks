class UsersController < ApplicationController
  def index
    @users = User.all

    respond_to do |format|
      format.html
      format.json
    end
  end

  def update
  	@user = current_user
    @user.update_attributes(user_params)
    if @user.save
      redirect_to root_path
      flash[:success] = "User has been updated!"
    else
      redirect_to root_path
      flash[:danger] = "An error has accured, didn't you fill all fields?"
    end
  end

  def user_params
    params.require(:user).permit(:info)
  end
end
