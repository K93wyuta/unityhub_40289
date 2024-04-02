FactoryBot.define do
  factory :channel_user do
    association :user
    association :channel
  end
end
