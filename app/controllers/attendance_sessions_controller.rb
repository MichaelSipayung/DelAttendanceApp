class AttendanceSessionsController < ApplicationController
  def index
  end

  def show
    @attendance_session = AttendanceSession.find(params[:id])
  end
  def new
    @attendance_session = current_hrdx_user.attendance_sessions.build
  end

  def create
    @attendance_session = current_hrdx_user.attendance_sessions.build(attendance_session_params)
    if @attendance_session.save
      redirect_to @attendance_session
    else
      render :new
    end
  end

  private
  def attendance_session_params
    params.require(:attendance_session).permit(
      :name, :begin, :end, :summary, :room, :course
    )
  end
end
