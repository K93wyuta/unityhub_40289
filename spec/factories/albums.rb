FactoryBot.define do
  factory :album do
    title { "Test Album Title" }
    association :channel
  end
end
