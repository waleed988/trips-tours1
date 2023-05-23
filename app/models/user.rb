class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  enum role:  [:buyer , :admin]
  after_initialize :set_default_role, :if => :new_record?
  validates :name, presence: true, length: { minimum: 3, maximum: 15 }
  validates :email, presence: true

  has_many :tours
  has_many :reviews
  validates :name, presence: true, length: { minimum: 3, maximum: 15 }
  
  # def to_s
  #   email
  # end
  # after_create do
  #   customer = Stripe::Customer.create(email: self.email)
  #   update(stripe_customer_id: customer.id)
  # end

  def set_default_role
    self.role ||= :buyer
  end
end
