class Furniture < ApplicationRecord
  has_many :appointments
  belongs_to :user
  enum :status, %i(onsale booked archived trashed, sold)
end
