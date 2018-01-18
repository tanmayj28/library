# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
  	name Faker::Name.name
  	author Faker::Name.name
  	publication Faker::Name.name
  	isbn Faker::Number.number(5)
  	price Faker::Number.number(2)
  	version Faker::Number.number(1)
  	association :library, factory: :library, strategy: :create
  	association :category, factory: :category, strategy: :create
  	association :issue_history, factory: :issue_history, strategy: :create
  end
end
