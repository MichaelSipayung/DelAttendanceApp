# frozen_string_literal: true

class PrklKrsDetail < ActiveRecord::Base
  establish_connection(:old_database)
  self.table_name = 'prkl_krs_detail'
  self.primary_key = 'krs_detail_id'
end
