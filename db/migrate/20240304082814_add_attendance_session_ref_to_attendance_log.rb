class AddAttendanceSessionRefToAttendanceLog < ActiveRecord::Migration[7.1]
  def change
    add_reference :attendance_logs, :attendance_session, null: false, foreign_key: true
  end
end
