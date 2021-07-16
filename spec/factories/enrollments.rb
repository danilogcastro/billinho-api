FactoryBot.define do
  factory :enrollment do
    amount { 100 }
    installments { 2 }
    due_day { rand(1..31) }
    association :student
    bills_attributes {[
      { amount: 50, due_date: "05/04/2020", status: 'open' },
      { amount: 50, due_date: "05/05/2020", status: 'open' }
    ]} 
  end
end