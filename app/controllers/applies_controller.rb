class AppliesController < ApplicationController
  def new
    @apply = Apply.new
  end

  def create
    @apply = Apply.new
    if @apply.save
      @apply.users << current_user
      redirect_to root_path
      flash[:notice] = "You applied"
    else
    end
  end

end
