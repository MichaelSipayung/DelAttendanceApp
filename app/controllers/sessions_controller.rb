class SessionsController < ApplicationController
  before_action :redirect_to_login, only: [:destroy]
  def new
  end

  def create
    response = AuthenticationService.new.authenticate(params[:session][:username],
                                                      params[:session][:password])
    if response['result']
      user = User.find_or_create_by(username: response['username'],
                                    user_id: response['user_id'])
      session[:user_id] = user.user_id
      # flash[:success] = "Logged in successfully!"
      if log_in_as_student?
        return redirect_to students_path
      end
      redirect_to attendance_sessions_path
    else
      flash.now[:danger] = '<i class="bi bi-exclamation-triangle-fill"></i> Invalid username or password.
        Please ensure they are the same as your CIS site credentials.'
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
