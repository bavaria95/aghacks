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
      @my_project_id = current_user.project_id
      @users_waiting_for_accept = []
      if @my_project_id
        @users = User.all
        @users.each do |user|
          if (user.is_confirmed == false) and (user.project_id == my_project_id)
            @users_waiting_for_accept << user
          end
        end
      render json: @users_waiting_for_accept
      end
    end

  end
end
