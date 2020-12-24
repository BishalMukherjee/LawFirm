class Billing < ApplicationRecord
  belongs_to :client, foreign_key: "client_id"
  validates :number_of_services, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
end