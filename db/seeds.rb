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

puts "All done!"