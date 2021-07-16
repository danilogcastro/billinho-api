class Enrollment < ApplicationRecord
  has_many :bills
  belongs_to :student

  validates :amount, numericality: { greater_than: 0 }
  validates :installments, numericality: { greater_than: 1 }
  validates :due_day, inclusion: { in: (1..31).to_a }
end
