FactoryBot.define do
  factory :channel do
    channel_main_image do
      Rack::Test::UploadedFile.new(Rails.root.join('public/images/test_profile_image.png'), 'test_profile_image.png')
    end
    channel_background_image do
      Rack::Test::UploadedFile.new(Rails.root.join('public/images/test_background_image.png'), 'test_background_image.png')
    end

    name { Faker::Name.name }
    identification { 'test_0000' }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    introduction { Faker::Lorem.paragraph(sentence_count: 2) }
  end
end
