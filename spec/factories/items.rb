FactoryBot.define do
  factory :item do
    name                  { Faker::Name.name }
    contents              { Faker::Verb.base }
    category_id           { Faker::Number.within(range: 2..11) }
    status_id             { Faker::Number.within(range: 2..7)  }
    delivery_fee_id       { Faker::Number.within(range: 2..3)  }
    first_address_id      { Faker::Number.within(range: 2..48) }
    delivery_day_id       { Faker::Number.within(range: 2..4) }
    price                 { Faker::Number.within(range: 300..10_000_000) }
    association :user
  end
end
