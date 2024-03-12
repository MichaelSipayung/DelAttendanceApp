class SessionsController < ApplicationController
  before_action :redirect_to_login, only: [:destroy]
  def new
  end

  def create
    response = AuthenticationService.new.authenticate(params[:session][:username], params[:session][:password])
    if response['result']
      user = User.find_or_create_by(username: response['username'], user_id: response['user_id'])
      session[:user_id] = user.user_id
      flash[:success] = "Logged in successfully!"
      redirect_to attendance_sessions_path
    else
      flash.now[:alert] = 'Invalid username or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    session.delete(:user_id)
    @current_user = nil
    flash[:success] = "Logged out successfully!"
    redirect_to root_path
  end

end
