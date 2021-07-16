FactoryBot.define do
  factory :bill do
    amount { 50 }
    due_date { "02/04/2021" }
    status { ['open', 'pending', 'paid'].sample }
    association :enrollment
  end
end