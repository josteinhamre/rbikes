class Bike < ApplicationRecord
  TYPE = %w[Road Mountain Hybrid TT BMX Cyclocross City]
  belongs_to :user
  validates :brand, :model, :bike_type, :photo, :price, presence: true
  validates :bike_type, inclusion: { in: TYPE }
  has_many :availabilities
  has_many :bookings
  has_many :bikes
  mount_uploader :photo, PhotoUploader

  def available_range?(start_date, end_date)
    bookings = self.bookings # Get bookings for this bike
    booking_ranges = bookings.map { |b| (b.start_date..b.end_date).to_a }.flatten
    query_range = (start_date..end_date).to_a
    query_range.each do |date|
      return false if booking_ranges.include?(date)
    end
    true
  end
end
