class SessionsController < ApplicationController
  def new
    redirect_to '/auth/github'
  end

  def create

    @user = User.find_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid])
    @user = begin
      user = User.create_from_omniauth(auth_hash)
      user.email = "test@test.pl"
      user.password = "test1234"
      user.save
      user
    end unless @user
    if @user
      #raise
      sign_in @user
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
