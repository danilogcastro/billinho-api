class Student < ApplicationRecord
  PAYMENT_METHODS = ["boleto", "credit_card"]
  date_regex = /\A(3[01]|[12][0-9]|0[1-9])\/(1[0-2]|0[1-9])\/[0-9]{4}\z/
  has_many :enrollments

  validates :name, presence: true
  validates :cpf, uniqueness: true
  validates :birthdate, format: { with: date_regex }, allow_nil: true
  validates :payment_method, inclusion: { in: PAYMENT_METHODS, message: "forma de pagamento deve ser válida" }
  validate :cpf_validator

  def cpf_validator
    cpf_array = cpf.split("").map {|x| x.to_i }
    
    product1 = (cpf_array[0] * 10) + (cpf_array[1] * 9) + (cpf_array[2] * 8) + (cpf_array[3] * 7) + (cpf_array[4] * 6) + (cpf_array[5] * 5) + (cpf_array[6] * 4) + (cpf_array[7] * 3) + (cpf_array[8] * 2)
    product2 = cpf_array[0] * 11 + cpf_array[1] * 10 + cpf_array[2] * 9 + cpf_array[3] * 8 + cpf_array[4] * 7 + cpf_array[5] * 6 + cpf_array[6] * 5 + cpf_array[7] * 4 + cpf_array[8] * 3 + cpf_array[9] * 2

    modulo1 = product1 % 11
    modulo2 = product2 % 11

    condition1 = (cpf_array[10] == 0 && [0,1].include?(modulo1)) || ( ![0,1].include?(modulo1) && cpf_array[9] == 11 - modulo1 )
    condition2 = (cpf_array[11] == 0 && [0,1].include?(modulo2)) || ( ![0,1].include?(modulo2) && cpf_array[10] == 11 - modulo2 )
    
    unless condition1 && condition2
      errors.add(:cpf, "não é válido")
    end
  end
end
