FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    region_id { 1 }
    city { '東京都' }
    street { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '08012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
