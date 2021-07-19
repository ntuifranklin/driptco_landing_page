#email
#city
#state
class Visitor < ApplicationRecord
  validates :email, presence: true, format: { with: /\A[^@,;\s]+@[^@\s]+\z/, message: "must be a valid email address" }
  validates :city, presence: true, format: { with: /\A[^@!%$#\*]+\z/, message: "must be a valid city"}
  validates :state, presence: true, format: { with: /\A[^@!%$#\*]+\z/, message: "must be a valid state" }  
end
