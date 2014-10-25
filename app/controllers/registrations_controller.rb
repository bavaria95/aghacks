class RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_user!, :only => :token

  def new
    super
  end

  def create
    super
  end

  def update
    @skills = params[:user][:skills]
    @skills = @skills.split(',')
    current_user.skills.each do |skill|
      skill.destroy
    end
    current_user.skills = []

    for i in 0..@skills.length-1
      current_user.skills << Skill.create(skill: @skills[i])
    end

    super
  end

end
