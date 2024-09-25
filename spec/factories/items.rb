FactoryBot.define do
  factory :item do
    name { 'Sample Item' }
    description { 'This is a sample description.' }
    category_id { 2 }
    status_id { 2 }
    responsibility_id { 2 }
    region_id { 2 }
    time_id { 2 }
    price { 500 }
    image {}
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('bin/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
