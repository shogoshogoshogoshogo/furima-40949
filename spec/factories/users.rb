FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { 'password123' }
    password_confirmation { password }
    family_name { '室田' }
    first_name { '祥吾' }
    family_name_kana { 'タナカ' } # 実際のアプリ要件に適合するカナ
    first_name_kana { 'タロウ' } # 実際のアプリ要件に適合するカナ
    birthdate { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
