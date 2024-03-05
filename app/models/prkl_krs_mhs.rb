# frozen_string_literal: true

class PrklKrsMhs < ActiveRecord::Base
  establish_connection(:old_database)
  self.table_name = 'prkl_krs_mhs'
  self.primary_key = 'krs_mhs_id'
end