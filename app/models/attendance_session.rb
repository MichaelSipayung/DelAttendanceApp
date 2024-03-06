class AttendanceSession < ApplicationRecord
  belongs_to :hrdx_pegawai, foreign_key: 'pegawai_id'
  has_many :attendance_logs

  def self.update_total_enrolled(total)
    self.update(:total_not_attend => total)
  end
end
