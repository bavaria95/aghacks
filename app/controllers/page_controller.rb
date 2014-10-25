class PageController < ApplicationController
  def index
    @projects = Project.all
    @users = User.all
    

    respond_to do |format|
      format.json
      format.html
    end
  end
end
