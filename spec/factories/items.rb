FactoryBot.define do
  factory :item do
    name                   { Faker::Commerce.product_name }
    description            { Faker::Lorem.paragraph_by_chars(number: rand(1..1000)) }
    category_id            { rand(2..11) }
    product_condition_id   { rand(2..7) }
    shipping_fee_bearer_id { rand(2..3) }
    prefecture_id          { rand(2..48) }
    days_to_ship_id        { rand(2..4) }
    price                  { rand(300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
