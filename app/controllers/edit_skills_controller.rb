class EditSkillsController < ApplicationController
	def index
		@user_skills = current_user.skills
	end

	def new
		@skill = Skill.new
		
	end

	def create
		@skill = Skill.create(skill_params)
    	if @skill.save
		current_user.skills << @skill
      		redirect_to root_path
      		flash[:notice] = "Skill has been created!"
    	else
      		redirect_to root_path
      		flash[:notice] = "Error!"
    	end
	end
end
