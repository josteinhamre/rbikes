class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bike
  validates :start_date, :end_date, :confirmed_at, presence: true
end
