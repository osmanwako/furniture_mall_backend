class Appointment < ApplicationRecord
  belongs_to :furniture
  belongs_to :customer, class_name: "User", foreign_key: "customer_id"
end
