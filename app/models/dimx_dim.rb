# frozen_string_literal: true

class DimxDim < ActiveRecord::Base
  establish_connection(:old_database)
  self.table_name = 'dimx_dim'
  self.primary_key = 'dim_id'
  belongs_to :sysx_user, foreign_key: 'user_id'
end
