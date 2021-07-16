require 'rails_helper'

describe Enrollment do
  it "valor não pode ser vazio" do
    enrollment = Enrollment.new(installments: 5, due_day: "05/04/2020")
    enrollment.student = FactoryBot.create(:student)
    expect(enrollment).to_not be_valid
  end

  it "valor deve ser maior do que zero" do
    enrollment = Enrollment.new(amount: 0, installments: 5, due_day: "05/04/2020")
    enrollment.student = FactoryBot.create(:student)
    expect(enrollment).to_not be_valid
  end

  it "deve ter pelo menos uma parcela" do
    enrollment = Enrollment.new(amount: 2000, installments: 0, due_day: "05/04/2020" )
    enrollment.student = FactoryBot.create(:student)
    expect(enrollment).to_not be_valid
  end

  it "dia de vencimento deve existir e ser válido" do
    enrollment = Enrollment.new(amount: 2000, installments: 3)
    enrollment.student = FactoryBot.create(:student)
    expect(enrollment).to_not be_valid
  end

  it "deve criar a matrícula se todos os campos estiverem corretos" do
    enrollment = FactoryBot.build(:enrollment)
    expect(enrollment).to be_valid
  end
end
