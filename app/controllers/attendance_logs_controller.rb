class AttendanceLogsController < ApplicationController
  before_action :redirect_to_login, only: [:create]
  def create
    attendance_session = AttendanceSession.find(params[:attendance_session_id])
    if attendance_session.active? && params[:secret_code].to_i == attendance_session.secret_code
      params[:attendance_logs].each do |student_id, attributes|
        attendance_session.attendance_logs.create!(
          dim: student_id, status: attributes[:status]) unless attributes[:status] == '1'
      end
      attendance_session.update(end: Time.now, active: false)
      flash[:success] = "Attendance session has been closed."
      redirect_to attendance_sessions_path
    else
      redirect_to attendance_session_path(attendance_session), alert: "Invalid secret code, please try again."
    end
  end

  private
  def attendance_log_params
    params.require(:attendance_log).permit(
      :dim, :status
    )
  end
end
