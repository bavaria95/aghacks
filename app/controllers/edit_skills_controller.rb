class EditSkillsController < ApplicationController
	def index
    @info = current_user.info
    @user_skills = current_user.skills
	end

	def new
		@skill = Skill.new
	end

	def create
		@skill = Skill.create(skill_params)
    @user_skills = current_user.skills

    if @skill.save
		  @user_skills << @skill
      #binding.pry
      redirect_to edit_skills_path
      flash[:success] = "Skill has been created!"
    else
    	redirect_to edit_skills_path
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
      redirect_to root_path
      flash[:notice] = "Edition ended successful!"
    else
      redirect_to root_path
      flash[:alert] = "An error has accured, didn't you fill all fields?"
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to root_path
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
