module Api
  class UsersController < ActionController::Base

    def show
      render json: current_user
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

    def remove
      if request.post?
        @user_find = current_user

        @user_find.project_id = nil
        @user_find.is_confirmed = nil
        
        @user_find.save!

        render json: { status: "ok" }, status: 200
      end
    end

    def needConfirmation
      @user_find = current_user

      # @user_find.project_id = nil
      # @user_find.is_confirmed = nil
      
      # @user_find.save!

      render json: { status: "ok" }, status: 200
    end
  end
end
