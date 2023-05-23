class Hotel < ApplicationRecord
  
  validates :name, presence: true, length: { minimum: 5, maximum: 15 }
  validates :category, presence: true
  validates :contact_no, presence: true
  validates :price_per_night, presence: true
  has_many :tour

end
