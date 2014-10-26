class RequestsController < ApplicationController

  def accept
    @applier = User.find(params[:applier_id])
    @applier.update_attributes(is_confirmed: true)
    @team_size = @applier.project.team_size.to_i
    @applier.project.update_attributes(team_size: @team_size + 1)
    redirect_to root_path
    flash[:success] = "Have have added new hackmate!"
  end

  def decline
    @applier = User.find(params[:applier_id])
    @applier.update_attributes(is_confirmed: nil)
    @applier.product.destroy
    redirect_to root_path
    flash[:success] = "You declined this request! So sad :-("
  end

end
