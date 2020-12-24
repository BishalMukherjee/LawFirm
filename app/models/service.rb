class Service < ApplicationRecord
  belongs_to :client, foreign_key: "client_id"
  validates :name, presence: true, uniqueness: true
  validate :client_id_validation
  validates :charge, presence: true, numericality: { only_integer: true, greater_than: 0 }

  private
  def client_id_validation
    unless self.client_id.nil?
      unless validates_presence_of :client
        errors.add(:client_id, "Invalid client")
      end
    end
  end
end