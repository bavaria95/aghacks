class ProjectsController < ApplicationController
	def index
		@projects = Project.all
	end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    if @project.save
      redirect_to root_path
      flash[:notice] = "Project has been created!"
    else
      redirect_to root_path
      flash[:notice] = "An error has accured, didn't you fill all fields?"
    end
  end

  def edit
    @project = Project.find(params[:id])
    render :edit
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(project_params)
    if @project.save
      redirect_to root_path
      flash[:notice] = "Project has been updated!"
    else
      redirect_to root_path
      flash[:alert] = "An error has accured, didn't you fill all fields?"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to root_path
    flash[:notice] = "Project has been deleted!"
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:name, :team, :long_description)
  end
end
