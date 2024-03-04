# frozen_string_literal: true

class AdakPengajaran < ActiveRecord::Base
  establish_connection(:old_database)
  self.table_name = 'adak_pengajaran'
  self.primary_key = 'pengajaran_id'
  # belongs_to :adak_penugasan_pengajaran, foreign_key: 'pengajaran_id
  has_many :adak_penugasan_pengajarans, foreign_key: 'pengajaran_id'

  # limit the result to the last academic year
  def self.all_pengajaran
    last_ta = AdakPengajaran.order(pengajaran_id: :desc).first
    AdakPengajaran.where(ta: last_ta.ta, sem_ta: last_ta.sem_ta)
  end
end
