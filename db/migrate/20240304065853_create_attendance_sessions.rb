class CreateAttendanceSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :attendance_sessions do |t|
      t.string :name
      t.string :begin
      t.string :end
      t.date :date
      t.string :summary
      t.string :room
      t.integer :course
      t.integer :total_attend
      t.integer :total_not_attend

      t.timestamps
    end
  end
end
