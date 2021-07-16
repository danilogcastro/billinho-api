FactoryBot.define do
  factory :student do
    name { Faker::Name.name }
    cpf { '05937966759' }
    birthdate { "02/11/1989" }
    payment_method { ['boleto', 'credit_card'].sample}
  end
end