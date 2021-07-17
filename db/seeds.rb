# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Seeding..."

50.times do
  student = Student.new(
    name: Faker::Name.name,
    cpf: "05937966759",
    birthdate: "02/11/1989",
    payment_method: Student::PAYMENT_METHODS.sample
  )
  student.save
  puts "Saved #{student.id} - #{student.name}"
end

50.times do
  enrollment = Enrollment.new(
    amount: 1200000,
    installments: 3,
    due_day: 5,
    bills_attributes: [
      { amount: 400000, due_date: "05/03/2021", status: 'open' }, 
      { amount: 400000, due_date: "05/04/2021", status: 'open' }, 
      { amount: 400000, due_date: "05/05/2021", status: 'open' }
    ]
  )
  enrollment.student = Student.sample
  enrollment.save
  puts "Salves enrollment #{enrollment.id}"
end

puts "All done!"