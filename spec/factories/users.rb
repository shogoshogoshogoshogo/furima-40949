FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { 'password123' }
    password_confirmation { password }
    family_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    family_name_kana { 'タナカ' } # 実際のアプリ要件に適合するカナ
    first_name_kana { 'タロウ' } # 実際のアプリ要件に適合するカナ
    birthdate { Faker::Date.birthday(min_age: 18, max_age: 65) }

    after(:build) do |user|
      file_path = Rails.root.join('public/images/test_image.png')
      if File.exist?(file_path)
        user.image.attach(io: File.open(file_path), filename: 'test_image.png')
      else
        puts "注意: #{file_path} が存在しません。正しいファイルパスを確認してください。"
      end
    end
  end
end
