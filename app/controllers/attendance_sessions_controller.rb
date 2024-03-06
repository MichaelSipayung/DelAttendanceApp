class AttendanceSessionsController < ApplicationController
  before_action :set_attendance_dropdown, only: [:new, :edit]
  def index
    @attendance_sessions = current_hrdx_user.attendance_sessions.all
  end

  def show
    @attendance_session = AttendanceSession.find(params[:id])
    @my_students = current_hrdx_user.my_students(@attendance_session.course)
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

  def edit
    @attendance_session = current_hrdx_user.attendance_sessions.find(params[:id])
  end

  def update
    @attendance_session = current_hrdx_user.attendance_sessions.find(params[:id])
    if @attendance_session.update(attendance_session_params)
      redirect_to @attendance_session
    else
      render :edit
    end
  end

  def destroy
    @attendance_session.destroy!
    redirect_to attendance_sessions_path
  end
  private
  def attendance_session_params
    params.require(:attendance_session).permit(
      :name, :begin, :end, :summary, :room, :course
    )
  end

  def set_attendance_dropdown
    temp = current_hrdx_user.my_courses
    map_to_adak_pengajaran = AdakPengajaran.find(temp.pluck(:pengajaran_id))
    # @attendance_session_dropdown = KrkmKuliah.find(map_to_adak_pengajaran.pluck(:kuliah_id))
    @attendance_session_dropdown = map_to_adak_pengajaran.map do |pengajaran|
      {pengajaran_id: pengajaran.id, nama_kul_ind: KrkmKuliah.find(pengajaran.kuliah_id).nama_kul_ind}
    end
  end
end
