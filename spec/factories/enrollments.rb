FactoryBot.define do
  factory :enrollment do
    amount { rand(1..1000) }
    installments { rand(1..12) }
    due_day { rand(1..31)}
    association :student
  end
end