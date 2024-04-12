FactoryBot.define do
  factory :event do
    name { 'Sample Event' }
    date_start { Date.today }
    date_end { Date.today + 1.week }
    time_start { DateTime.now }
    time_end { DateTime.now + 2.hours }
    place { 'Sample Place' }
    detail { 'Sample Detail' }
    association :channel
    association :channel_user
  end
end
