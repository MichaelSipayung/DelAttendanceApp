class AttendanceLogsController < ApplicationController
  def create
    attendance_session = AttendanceSession.find(params[:attendance_session_id])
    params[:attendance_logs].each do |student_id, attributes|
      unless attributes[:status] == '1'
        attendance_session.attendance_logs.create!(dim: student_id, status: attributes[:status])
      end
    end
    redirect_to attendance_sessions_path
  end

  private
  def attendance_log_params
    params.require(:attendance_log).permit(
      :dim, :status
    )
  end
end
