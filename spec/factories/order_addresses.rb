FactoryBot.define do
  factory :order_address do
    postal_code      { '123-4567' }
    shipping_area_id { 2 }
    city             { '市区町村' }
    address          { '番地' }
    building_name    { '建物名' }
    phone_number     { '12345678901'}
    # item_id          { '1' }
    # user_id          { '1' }
  end
end