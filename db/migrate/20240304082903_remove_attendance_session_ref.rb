class RemoveAttendanceSessionRef < ActiveRecord::Migration[7.1]
  def change
    remove_column :attendance_sessions, :attendance_session_id
  end
end
