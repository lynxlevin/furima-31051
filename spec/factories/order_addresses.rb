FactoryBot.define do
  factory :order_address do
    zipcode           { Faker::Address.postcode }
    prefecture_id     { rand(2..48) }
    city              { Faker::Address.city }
    block             { Faker::Address.street_name }
    building_and_room { Faker::Creature::Dog.breed + " #{rand(101..999)}号室" }
    telephone_number  { "0#{rand(100_000_000..9_099_999_999)}" }
    token             { 'tok_abcdefghijk00000000000000000' }
  end
end
