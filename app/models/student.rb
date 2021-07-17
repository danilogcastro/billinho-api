class Student < ApplicationRecord
  after_save :format_cpf

  PAYMENT_METHODS = ["boleto", "credit_card"]
  has_many :enrollments, dependent: :destroy

  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :payment_method, inclusion: { in: PAYMENT_METHODS, message: "forma de pagamento deve ser válida" }
  validates_with CpfValidator

  def as_json(options = {})
    {
      id: id,
      name: name,
      cpf: cpf,
      birthdate: birthdate.to_s,
      payment_method: translated_payment
    }
  end
  
  private
  def format_cpf
    formatted_cpf = "#{self.cpf[0..2]}.#{self.cpf[3..5]}.#{self.cpf[6..8]}-#{self.cpf[9..10]}#{self.cpf[11..12]}"
    self.update_column(:cpf, formatted_cpf)
  end

  def translated_payment
    if self.payment_method == "credit_card"
      "Cartão de crédito"
    else
      "Boleto"
    end
  end
end
