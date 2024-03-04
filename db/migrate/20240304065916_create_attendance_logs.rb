class CreateAttendanceLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :attendance_logs do |t|
      t.string :dim
      t.string :status

      t.timestamps
    end
  end
end
