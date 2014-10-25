class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :destroy, :new, :update]
	def index
		@projects = Project.all

    respond_to do |format|
      format.html
      format.json
    end
	end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    @creator = current_user
    @skills = params[:project][:skills]
    @skills = @skills.split(',')

    #binding.pry
    if @project.save
      for i in 0..@skills.length-1
        @project.skills << Skill.create(skill: @skills[i])
      end
      @project.update_attributes(creator: @creator.username)
      redirect_to root_path
      flash[:success] = "Project has been created!"
    else
      redirect_to new_project_path
      flash[:danger] = "An error has accured, didn't you fill all fields?"
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
      flash[:success] = "Project has been updated!"
    else
      redirect_to root_path
      flash[:danger] = "An error has accured, didn't you fill all fields?"
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
    params.require(:project).permit(:name, :team, :long_description, :apply_id, :skills_attributes => [:skill])
  end
end
