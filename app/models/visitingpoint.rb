class Visitingpoint < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 15 }
  validates :location, presence: true

  has_many :tour
end
