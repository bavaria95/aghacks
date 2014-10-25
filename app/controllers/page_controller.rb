class PageController < ApplicationController
  def index
    #binding.pry
    @projects = Project.all
    @users = User.all
    @project = Project.find_by_creator(current_user.username)

    respond_to do |format|
      format.json
      format.html
    end
  end
end
