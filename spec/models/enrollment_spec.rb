require 'rails_helper'

describe Enrollment do
  it "valor deve ser maior do que zero" do
    enrollment = Enrollment.new(amount: 0, installments: 5, due_day: 4)
    enrollment.student = FactoryBot.create(:student)
    expect(enrollment).to_not be_valid
  end

  it "deve ter pelo menos uma parcela" do
    enrollment = Enrollment.new(amount: 2000, installments: 0, due_day: 4 )
    enrollment.student = FactoryBot.create(:student)
    expect(enrollment).to_not be_valid
  end

  it "dia de vencimento deve existir e ser válido" do
    enrollment = Enrollment.new(amount: 2000, installments: 3)
    enrollment.student = FactoryBot.create(:student)
    expect(enrollment).to_not be_valid
  end

  it "deve criar a matrícula se todos os campos estiverem corretos" do
    enrollment = Enrollment.new(amount: 100, 
                                installments: 2, 
                                due_day: 5,
                                bills_attributes: [
                                  { amount: 50, due_date: "05/04/2020", status: 'open' },
                                  { amount: 50, due_date: "05/05/2020", status: 'open' }
                                ])
    enrollment.student = FactoryBot.create(:student)

    expect(enrollment).to be_valid
  end
end
