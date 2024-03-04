class AttendanceSession < ApplicationRecord
  belongs_to :hrdx_pegawai, foreign_key: 'hrdx_pegawai_id'
  has_many :attendance_logs
end
