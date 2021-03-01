FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 3, min_numeric: 3)}
    password_confirmation {password}
    gimei = Gimei.name
    last_name             {gimei.last.kanji}
    first_name            {gimei.first.kanji}              
    last_name_kana        {gimei.last.katakana}            
    first_name_kana       {gimei.first.katakana}              
    birthday              {'1930-01-01'}
  end
end