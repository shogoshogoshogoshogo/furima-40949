FactoryBot.define do
  factory :item do
    name { 'Sample Item' }
    description { 'This is a sample description.' }
    category_id { 2 } # 適当な値に設定
    status_id { 2 } # 適当な値に設定
    responsibility_id { 2 } # 適当な値に設定
    region_id { 2 } # 適当な値に設定
    time_id { 2 } # Other than '1' (which is '---')
    price { 500 } # Between 300 and 9,999,999
    association :user
  end
end
