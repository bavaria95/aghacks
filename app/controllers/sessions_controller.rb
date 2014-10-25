class SessionsController < ApplicationController
  def new
    redirect_to '/auth/github'
  end

  def create
    request_info = request.env['omniauth.auth']

    @email_request = request_info[:info][:email]
    if User.find_by_email(@email_request) == nil
      user = User.new
      user.email = request_info[:info][:email]
      user.username = request_info[:info][:name]
      user.password = (0...16).map { (97 + rand(26)).chr }.join
      user.save
    else
      user = User.find_by_email(@email_request)
    end
    sign_in user
    redirect_to root_url

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
