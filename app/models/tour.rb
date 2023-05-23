class Tour < ApplicationRecord
  
  
  belongs_to :user
  has_many :visitingpoints
  has_many :hotels
  has_many :transports
end
