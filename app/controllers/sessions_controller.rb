class SessionsController < ApplicationController
  def new
  end

  def create
    response = AuthenticationService.new.authenticate(params[:session][:username], params[:session][:password])
    if response['result']
      user = User.find_or_create_by(username: response['username'], user_id: response['user_id'])
      session[:user_id] = user.id
      # redirect_to root_path
      flash[:notice] = 'You have successfully logged in'
    else
      flash.now[:alert] = 'Invalid username or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
