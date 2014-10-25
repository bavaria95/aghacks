class EditSkillsController < ApplicationController
	def index
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

  private

  def skill_params
    params.require(:skill).permit(:skill)
  end
end
