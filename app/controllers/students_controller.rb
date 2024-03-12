class StudentsController < ApplicationController
  before_action :set_student, only: [:index]
  def index
    @today_courses = AttendanceSession.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)
    # @today_courses_logs = @today_courses.attendance_logs
  end
  private
  # def set_student
  #   unless log_in_as_student?
  #     redirect_to login_path
  #   end
  # end
end
