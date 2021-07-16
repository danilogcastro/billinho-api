class Bill < ApplicationRecord
  belongs_to :enrollment

  validates :amount, numericality: { greater_than: 0 }
  validates :status, inclusion: { in:['open', 'pending', 'paid'] }
end
