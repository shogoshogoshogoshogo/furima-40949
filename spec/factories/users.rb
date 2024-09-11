FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { 'password123' } # シンプルでバリデーションを通るパスワード
    password_confirmation { password }
    family_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    family_name_kana { Faker::Name.last_name } # 注意: 簡単な例として英語のカナですが、実際のアプリの要件に合わせてください
    first_name_kana { Faker::Name.first_name } # 同上
    birthdate { Faker::Date.birthday(min_age: 18, max_age: 65) }

    after(:build) do |user|
      user.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
