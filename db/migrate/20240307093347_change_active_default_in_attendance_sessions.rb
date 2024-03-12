class ChangeActiveDefaultInAttendanceSessions < ActiveRecord::Migration[7.1]
  def change
    change_column_default :attendance_sessions, :active, from: false, to: true
  end
end
