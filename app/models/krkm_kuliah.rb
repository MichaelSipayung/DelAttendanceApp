# frozen_string_literal: true

class KrkmKuliah < ActiveRecord::Base
  establish_connection(:old_database)
  self.table_name = 'krkm_kuliah'
  self.primary_key = 'kuliah_id'
end
