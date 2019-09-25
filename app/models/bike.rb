class Bike < ApplicationRecord
  TYPE = %w[Road Mountain Hybrid TT BMX Cyclocross City]
  belongs_to :user
  validates :brand, :model, :bike_type, presence: true
  validates :bike_type, inclusion: { in: TYPE }
  has_many :availabilities
  has_many :bookings
  has_many :bikes
  mount_uploader :photo, PhotoUploader
end

