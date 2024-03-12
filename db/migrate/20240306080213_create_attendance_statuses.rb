class CreateAttendanceStatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :attendance_statuses do |t|
      t.string :status

      t.timestamps
    end
  end
end
