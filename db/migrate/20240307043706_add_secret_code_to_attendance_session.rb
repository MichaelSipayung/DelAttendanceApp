class AddSecretCodeToAttendanceSession < ActiveRecord::Migration[7.1]
  def change
    add_column :attendance_sessions, :secret_code, :integer
  end
end
