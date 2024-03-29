
module StudentsHelper
  def log_in_as_student? # check if the user is a student
    if logged_in?
      temp=SysxUser.find_by(user_id: session[:user_id])
      temp.authentication_method_id==2
    end
  end

  def set_student # callback for student controller
    unless log_in_as_student? && logged_in? # remove the logged_in? condition
      redirect_to login_path
    end
  end

  def set_pegawai # callback for pegawai controller
    unless log_in_as_student?!=true
      redirect_to login_path
    end
  end
end
