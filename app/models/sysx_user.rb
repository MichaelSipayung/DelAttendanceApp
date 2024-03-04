# frozen_string_literal: true

class SysxUser < ActiveRecord::Base
  establish_connection(:old_database)
  self.table_name = 'sysx_user'
  self.primary_key = 'user_id'
  has_one :dimx_dim, foreign_key: 'user_id'
  has_one :hrdx_pegawai, foreign_key: 'user_id'
end
