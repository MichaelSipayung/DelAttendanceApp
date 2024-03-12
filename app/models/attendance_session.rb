class AttendanceSession < ApplicationRecord
  validates :course, presence: true
  validates :name, presence: true, length: { minimum: 5, maximum: 100 }
  validates :begin, presence: true, format: { with: /\A([01]?[0-9]|2[0-3])\.[0-5][0-9]\z/,
                      message: "must be a valid time format (HH.mm)" }
  validates :room, presence: true, length: { minimum: 1, maximum: 20 }
  validates :summary, presence: true, length: { minimum: 10, maximum: 200 }
  # validates :course, presence: true
  belongs_to :hrdx_pegawai, foreign_key: 'pegawai_id'
  has_many :attendance_logs, dependent: :destroy

  def self.update_total_enrolled(total)
    self.update(:total_not_attend => total)
  end

  def self.update_secret_code
    self.update(:secret_code => generate_secret)
  end

  def self.generate_secret
    rand(1000..9999)
  end
end
