class Student < ApplicationRecord
  PAYMENT_METHODS = ["boleto", "credit_card"]
  has_many :enrollments

  validates :name, presence: true
  validates :cpf, uniqueness: true
  validates :payment_method, inclusion: { in: PAYMENT_METHODS, message: "forma de pagamento deve ser válida" }
  validates_with CpfValidator
end
