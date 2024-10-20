FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    region_id { 1 }
    city { '東京都' }
    street { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '08012345678' }
  end
end
