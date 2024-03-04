# frozen_string_literal: true

class HrdxPegawai < ActiveRecord::Base
  establish_connection(:old_database)
  self.table_name = 'hrdx_pegawai'
  self.primary_key = 'pegawai_id'
  belongs_to :sysx_user, foreign_key: 'user_id'
  has_many :adak_penugasan_pengajarans, foreign_key: 'pegawai_id'
  has_many :attendance_sessions, foreign_key: 'pegawai_id'
  def my_courses
    self.adak_penugasan_pengajarans.where(pengajaran_id: AdakPengajaran.all_pengajaran)
  end
end
