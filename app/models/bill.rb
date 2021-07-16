class Bill < ApplicationRecord
  belongs_to :enrollment, inverse_of: :bills

  validates :amount, numericality: { greater_than: 0 }
  validates :status, inclusion: { in:['open', 'pending', 'paid'] }
  validates_presence_of :enrollment
end
