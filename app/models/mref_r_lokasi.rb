# frozen_string_literal: true

class MrefRLokasi < ActiveRecord::Base
  establish_connection(:old_database)
  self.table_name = 'mref_r_lokasi'
  self.primary_key = 'lokasi_id'

  def self.available_locations
    # MrefRLokasi.all.map{ |lokasi| [lokasi.name, lokasi.lokasi_id]}
    MrefRLokasi.order(:name).map { |lokasi| [lokasi.name, lokasi.lokasi_id]  }
  end

  def self.get_location_name(id)
    location = MrefRLokasi.find_by(lokasi_id: id)
    if location.nil?
      MrefRLokasi.find(1).name
    else
      location.name
    end
  end
end
