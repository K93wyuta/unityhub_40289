FactoryBot.define do
  factory :user do
    profile_image do
      Rack::Test::UploadedFile.new(Rails.root.join('public/images/test_profile_image.png'), 'test_profile_image.png')
    end
    background_image do
      Rack::Test::UploadedFile.new(Rails.root.join('public/images/test_background_image.png'), 'test_background_image.png')
    end

    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    gender_id { Faker::Number.between(from: 2, to: 4) }
    age_id { Faker::Number.between(from: 2, to: 44) }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    mbti_id { Faker::Number.between(from: 2, to: 17) }
    line { Faker::Alphanumeric.alphanumeric(number: 10) }
    paypay { Faker::Alphanumeric.alphanumeric(number: 10) }
    profile { Faker::Lorem.paragraph(sentence_count: 2) }
  end
end
