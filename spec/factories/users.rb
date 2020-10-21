Faker::Config.locale = :ja
FactoryBot.define do
  factory :user do
    nickname              {Faker::Internet.username}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6) + "1"} #Fakerでは半角英字のみの場合がある為、1を追加
    password_confirmation {password}
    family_name_kanji     {Faker::Name.last_name}
    first_name_kanji      {Faker::Name.first_name}
    family_name_katakana  {Faker::Food.sushi} #全角カナの生成のために使用
    first_name_katakana   {Faker::Food.sushi} #全角カナの生成のために使用
    birthday              {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
  end
end
