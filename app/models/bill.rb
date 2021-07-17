class Bill < ApplicationRecord
  belongs_to :enrollment, inverse_of: :bills

  validates :amount, numericality: { greater_than: 0 }
  validates :status, inclusion: { in:['open', 'pending', 'paid'] }
  validates_presence_of :enrollment

  def as_json(options = {})
    {
      id: id,
      due_date: due_date.to_s,
      status: status,
      amount: amount
    }
  end
end
