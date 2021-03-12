FactoryBot.define do
  factory :PurchaseAddress do
    postal_code                { '000-0000' }
    first_address_id           { Faker::Number.within(range: 2..48) }
    second_address             { Faker::Address.street_address }
    third_address              { Faker::Address.secondary_address }
    fourth_address             { }
    telephone                  { Faker::Number.number(digits: 11) }
    price                      { Faker::Number.within(range: 300..10_000_000) }
    token                      { 'token' }
  end
end