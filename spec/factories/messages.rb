FactoryBot.define do
  factory :message do
    message_image do
      Rack::Test::UploadedFile.new(Rails.root.join('public/images/test_profile_image.png'), 'test_profile_image.png')
    end

    content { Faker::Lorem.paragraph(sentence_count: 2) }
    association :channel_chat_user
    association :chat
  end
end
