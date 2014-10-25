class SkillsController < ApplicationController

  def index
    @skills = Skill.all
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.create(skill_params)
    if @skill.save
      redirect_to skills_path
      flash[:success] = "Skill has been created!"
    else
      redirect_to redirect_to skills_user
      flash[:danger] = "Error!"
    end
  end

  def edit
    @skill = Skill.find(params[:id])
    render :edit
  end

  def update
    @skill = Skill.find(params[:id])
    @skill.update_attributes(skill_params)
    if @skill.save
      redirect_to skills_path
      flash[:notice] = "Edition ended successful!"
    else
      redirect_to skills_path
      flash[:alert] = "An error has accured, didn't you fill all fields?"
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to skills_path
    flash[:notice] = "Skill has been deleted!"
  end

  def show
    @skill = Skill.find(params[:id])
  end

  private

  def skill_params
    params.require(:skill).permit(:skill)
  end
end
