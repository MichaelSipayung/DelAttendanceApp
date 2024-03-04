class AddForeignKeyToAttendanceSession < ActiveRecord::Migration[7.1]
  def change
    add_column :attendance_sessions, :pegawai_id, :integer
  end
end
