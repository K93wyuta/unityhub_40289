FactoryBot.define do
  factory :chat do
    chat_image do
      Rack::Test::UploadedFile.new(Rails.root.join('public/images/test_profile_image.png'), 'test_profile_image.png')
    end

    name { Faker::Name.name }
    association :channel
  end
end
