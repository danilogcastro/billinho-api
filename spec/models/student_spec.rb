require 'rails_helper'

describe Student do
  it "deve ter nome" do
    student = Student.new(name: nil, cpf: "05937966759", payment_method: "boleto")
    expect(student).to_not be_valid
  end

  it "deve ter um cpf válido e único" do
    student = Student.new(name: "João da Silva", cpf: "05937966759", payment_method: "boleto")
    expect(student).to be_valid
  end

  it "número do cpf precisa seguir as regras" do
    student = Student.new(name: "João da Silva", cpf: "01239746498", payment_method: "boleto")
    expect(student).to_not be_valid
  end

  it "deve ter forma de pagamento cartão de crédito ou boleto" do
    student = Student.new(name: "João da Silva", cpf: "05937966759", payment_method: "débito")
    expect(student).to_not be_valid
  end

  it "data de nascimento é opcional" do
    student = Student.new(name: "João da Silva", cpf: "05937966759", payment_method: "boleto", birthdate: nil)
    expect(student).to be_valid
  end

  it "deve criar um estudante válido com todas as informações corretas" do
    student = FactoryBot.build(:student)
    expect(student).to be_valid
  end
end
