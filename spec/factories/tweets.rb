FactoryBot.define do
  factory :tweet do
    tweet_image do
      Rack::Test::UploadedFile.new(Rails.root.join('public/images/test_profile_image.png'), 'test_profile_image.png')
    end

    text { Faker::Lorem.paragraph(sentence_count: 2) }
  end
end
