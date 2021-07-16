require 'rails_helper'

describe Bill do
  it "não pode ser vazio" do
    bill = Bill.new(due_date: "05/04/2020", status: 'open')
    bill.enrollment = FactoryBot.create(:enrollment)
    expect(bill).to_not be_valid
  end

  it "deve ser maior do que zero" do
    bill = Bill.new(amount: 0, due_date: "05/04/2020", status: 'open')
    bill.enrollment = FactoryBot.create(:enrollment)
    expect(bill).to_not be_valid
  end

  it "deve possuir um status válido" do
    bill = Bill.new(amount: 1000, due_date: "05/04/2020", status: 'pendente')
    bill.enrollment = FactoryBot.create(:enrollment)
    expect(bill).to_not be_valid
  end

  it "deve ser válida com todos os campos preenchidos corretamente" do
    bill = FactoryBot.create(:bill)
    expect(bill).to be_valid
  end
end
