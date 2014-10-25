module Api
  class UsersController < ActionController::Base

    def show
      render json: Project.find(params[:id])
    end

    def apply
      if request.post?
        project = params[:id]

        @project_find = Project.find(project)
        @user_find = current_user

        @user_find.project_id = @project_find.id 
        @user_find.is_confirmed = false
        
        @user_find.save!

        render json: { status: "ok" }, status: 200
      end

    end
  end
end
