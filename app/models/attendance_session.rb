class AttendanceSession < ApplicationRecord
  belongs_to :hrdx_pegawai, foreign_key: 'pegawai_id'
  has_many :attendance_logs
end
