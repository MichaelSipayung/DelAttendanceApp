class AttendanceStatus < ApplicationRecord
  def self.available_status
    AttendanceStatus.all.map { |status| [status.status, status.id] }
  end
end
