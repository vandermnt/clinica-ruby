# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'cpf_faker'
require 'faker'

5.times do
  Patient.create(
    name: Faker::Name.name_with_middle,
    cpf: Faker::CPF.numeric,
    age: '1990/05/17',
    telefone: Faker::Number.number(9),
    email: Faker::Internet.free_email,
    address: Faker::Address.street_name,
    profession: 'Pedreiro'
  )
end
