module SessionsHelper
  def logged_in?
    !current_user.nil?
  end

  def current_user
    if(user_id = session[:user_id])
      @current_user ||= User.find_by(user_id: user_id)
    end
  end

  def redirect_to_login
    redirect_to login_path unless logged_in?
  end
end
