class Review < ApplicationRecord
  validates :message, presence: true, length: { minimum: 10, maximum: 15 }
  
  belongs_to :user
  

end
