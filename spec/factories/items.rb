FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    category_id { rand(1..10) } # ランダムなカテゴリIDを設定
    status_id { rand(1..5) }    # ランダムなステータスIDを設定
    responsibility_id { rand(1..5) } # 適切なランダムな値を設定
    region_id { rand(1..47) }   # ランダムな地域IDを設定（47都道府県を想定）
    time_id { rand(1..5) }      # ランダムな時間IDを設定
    price { Faker::Commerce.price(range: 100..10_000) } # ランダムな価格を設定
  end
end
