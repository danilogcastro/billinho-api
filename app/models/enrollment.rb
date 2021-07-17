class Enrollment < ApplicationRecord
  has_many :bills, inverse_of: :enrollment, dependent: :destroy
  belongs_to :student
  accepts_nested_attributes_for :bills

  validates :amount, numericality: { greater_than: 0 }
  validates :installments, numericality: { greater_than: 1 }
  validates :due_day, inclusion: { in: (1..31).to_a }

  validate :limit_sum
  validate :equal_bills

  def as_json(options = {})
    {
      id: id,
      student_id: student.id,
      amount: amount,
      installments: installments,
      due_day: due_day,
      bills: bills.as_json
    }
  end

  def limit_sum
    errors.add(:amount, "valor não pode ser maior do que a soma das parcelas") if amount > bills.map { |record| record.amount }.sum
  end

  def equal_bills
    errors.add(:installments, "precisa ter o mesmo número de parcelas") if installments != bills.size
  end
end
