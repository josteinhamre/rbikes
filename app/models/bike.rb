class Bike < ApplicationRecord
  TYPE = %w[Road Mountain Hybrid TT BMX Cyclocross City]
  belongs_to :user
  validates :brand, :model, :type, presence: true
  validates :type, inclusion: { in: TYPE }
end

