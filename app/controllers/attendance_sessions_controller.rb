class AttendanceSessionsController < ApplicationController
  before_action :redirect_to_login, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_attendance_session, only: [:show, :edit, :update, :destroy]
  before_action :set_pegawai, only: [:index]
  before_action :set_attendance_dropdown, only: [:new, :edit, :index, :create, :update]

  def index
    #@attendance_sessions = current_hrdx_user.attendance_sessions.all
    @attendance_sessions = current_hrdx_user.attendance_sessions.order(created_at: :desc).limit(20)
    @attendance_session = current_hrdx_user.attendance_sessions.build
    #.limit(12)
    # @total_students = current_hrdx_user.total_students(@attendance_sessions)
  end

  def show
    @attendance_session = AttendanceSession.find(params[:id])
    @my_students = current_hrdx_user.my_students(@attendance_session.course)
    @not_attend = @attendance_session.attendance_logs
  end
  def new
    @attendance_session = current_hrdx_user.attendance_sessions.build
  end

  def create
    @attendance_session = current_hrdx_user.attendance_sessions.build(attendance_session_params)
    if @attendance_session.save
      @my_students = current_hrdx_user.my_students(@attendance_session.course)
      @attendance_session.update(total_not_attend: @my_students.count)
      @attendance_session.update(secret_code: AttendanceSession.generate_secret)
      # AttendanceSession.update_total_enrolled(@my_students.count)
      redirect_to @attendance_session
    else
      render '_form'
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
    @attendance_session = current_hrdx_user.attendance_sessions.find(params[:id])
    @attendance_session.destroy!
    # @attendance_session.destroy!
    redirect_to attendance_sessions_path
  end
  private
  def attendance_session_params
    params.require(:attendance_session).permit(
      :name, :begin, :summary, :room, :course)
  end

  def set_attendance_dropdown
    temp = current_hrdx_user.my_courses
    map_to_adak_pengajaran = AdakPengajaran.find(temp.pluck(:pengajaran_id))
    # @attendance_session_dropdown = KrkmKuliah.find(map_to_adak_pengajaran.pluck(:kuliah_id))
    @attendance_session_dropdown = map_to_adak_pengajaran.map do |pengajaran|
      {pengajaran_id: pengajaran.id, nama_kul_ind: KrkmKuliah.find(pengajaran.kuliah_id).nama_kul_ind}
    end
  end

  def set_attendance_session
    @attendance_session = AttendanceSession.find_by(id: params[:id])
    if @attendance_session == nil
      return redirect_to root_path
    end
    redirect_to root_path unless @attendance_session.hrdx_pegawai == current_hrdx_user
  end
end
