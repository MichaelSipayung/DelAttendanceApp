class AddActiveToAttendanceSession < ActiveRecord::Migration[7.1]
  def change
    add_column :attendance_sessions, :active, :boolean
  end
end
