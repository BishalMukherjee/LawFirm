class Client < ApplicationRecord
  after_save :create_billings
  has_many :services
  has_one :billing, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }

  def create_billings
    total = 0

    unless self.services.blank?
      for service in (self.services) do
        total = total + service.charge
      end
    end

    Billing.create(client_id: self.id, number_of_services: self.services.count, amount: total)
  end
end