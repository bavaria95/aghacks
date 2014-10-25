module Api
  class ProjectsController < ActionController::Base

    def show
      render json: Project.find(params[:id])
    end

    def apply
      if request.post?
        user = params[:user_id]
        project = params[:id]

        @project_find = Project.find(project)
        @user_find = User.find(user)

        if @project_find.apply_id == nil && @user_find.apply_id == nil
          @apply = Apply.create
          @project_find.update_attributes(apply_id: @apply.id)
          @user_find.update_attributes(apply_id: @apply.id)
          render json: { status: "ok" }, status: 200
        else
          render json: { error: "this project is already applied"}, status: 404
        end
      end

    end
  end
end
