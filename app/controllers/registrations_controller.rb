class RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_user!, :only => :token

  def new
      super
    end


  def create
    binding.pry
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "You have signed up successfully. If enabled, a confirmation was sent to your e-mail."
      redirect_to root_url
    else
      render :action => :new
    end
  end

  def update
    @skills = params[:user][:skills]
    @skills = @skills.split(',')
    #binding.pry
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
