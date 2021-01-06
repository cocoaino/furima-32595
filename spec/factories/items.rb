FactoryBot.define do
  factory :item do
    name {"Apple"}
    description {"hi"}
    price {1000}
    category_id {2}
    status_id {2}
    shipping_charge_id {2}
    shipping_area_id {2}
    shipping_day_id {2}

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
