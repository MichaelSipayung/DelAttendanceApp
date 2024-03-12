class ApplicationController < ActionController::Base
  include SessionsHelper
  def current_hrdx_user
    @current_hrdx_user ||= HrdxPegawai.find_by(user_id: session[:user_id])
  end
  #
  # def my_student_courses
  # end


end