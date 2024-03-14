module SessionsHelper
  def logged_in?
    !current_user.nil?
  end

  def current_user
    if(user_id = session[:user_id])
      @current_user ||= User.find_by(user_id: user_id)
    elsif(user_id = cookies.encrypted[:user_id])
      user = User.find_by(user_id: user_id)
      if user&.authenticated?(:remember, cookies[:remember_token])
        session[:user_id] = user.user_id
        @current_user = user
      end
    end
  end

  def redirect_to_login
    redirect_to login_path unless logged_in?
  end

  def remember(user) # remember the user
    user.remember
    cookies.permanent.encrypted[:user_id] = user.user_id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user) # forget the user
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  def change_root
    if logged_in?
      if log_in_as_student?
        redirect_to students_path
      else
        redirect_to attendance_sessions_path
      end
    end
  end
end
