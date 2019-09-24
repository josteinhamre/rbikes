class Availability < ApplicationRecord
  belongs_to :bike
  validates :from, :to, :price, presence: true
end
