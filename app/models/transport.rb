class Transport < ApplicationRecord
  validates :registration_no, presence: true, length: { minimum: 5, maximum: 15 }
  validates :driver_cnic, presence: true
  validates :driver_name, presence: true
  validates :driver_phone, presence: true
  validates :price, presence: true

  has_many :tour
end
