class CpfValidator < ActiveModel::EachValidator
  def cpf_validator(record, attribute, value)
    cpf_array = value.split("")
    product1 = cpf_array[0] * 10 + cpf_array[1] * 9 + cpf_array[2] * 8 + cpf_array[3] * 7 + cpf_array[4] * 6 + cpf_array[5] * 5 + cpf_array[6] * 4 + cpf_array[7] * 3 * cpf_array[8] * 2
    product2 = cpf_array[0] * 11 + cpf_array[1] * 10 + cpf_array[2] * 9 + cpf_array[3] * 8 + cpf_array[4] * 7 + cpf_array[5] * 6 + cpf_array[6] * 5 + cpf_array[7] * 4 * cpf_array[8] * 3 + cpf_array[9] * 2

    modulo1 = product1 % 11
    modulo2 = product2 % 11

    condition1 = (cpf_array[10] == 0 && [0,1].include?(modulo1)) || ( ![0,1].include?(modulo1) && cpf_array[10] != 0)
    condition2 = (cpf_array[11] == 0 && [0,1].include?(modulo2)) || ( ![0,1].include?(modulo2) && cpf_array[11] != 0)

    unless condition1 && condition2
      record.errors.add(attribute, "não é válido")
    end
  end
end