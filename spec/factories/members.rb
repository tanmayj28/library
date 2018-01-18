# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member do
    name Faker::Name.name
    address Faker::Address.street_address
    phone Faker::PhoneNumber.cell_phone
    code Faker::Number.number(2)
    gender 'male'
    validity_date '2018-01-11'
    is_author 't'
    association :library, factory: :library, strategy: :create
  end
end