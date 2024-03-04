class ApplicationController < ActionController::Base
  def current_hrdx_user
    @current_hrdx_user ||= HrdxPegawai.find_by(user_id: session[:user_id])
  end
end
