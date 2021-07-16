class Student < ApplicationRecord
  PAYMENT_METHODS = ["boleto", "credit_card"]
  date_regex = /\A(3[01]|[12][0-9]|0[1-9])\/(1[0-2]|0[1-9])\/[0-9]{4}\z/
  has_many :enrollments

  validates :name, presence: true
  validates :cpf, uniqueness: true
  validates :birthdate, format: { with: date_regex }, allow_nil: true
  validates :payment_method, inclusion: { in: PAYMENT_METHODS, message: "forma de pagamento deve ser válida" }
  validates_with CpfValidator
end
