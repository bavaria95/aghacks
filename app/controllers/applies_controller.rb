class AppliesController < ApplicationController
  def new
    @apply = Apply.new
  end

  def create
    @apply = Apply.new
    #binding.pry
    if @apply.save
      @apply.users << current_user
      redirect_to root_path
      flash[:notice] = "You applied"
    else
    end
  end

  # private

  # def apply_params
  #   params.require(:apply).permit(:id)
  # end
end
