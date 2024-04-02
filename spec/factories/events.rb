FactoryBot.define do
  factory :event do
    name { "Sample Event" }
    date_start { Date.today }
    date_end { Date.today + 1.week }
    time_start { DateTime.now }
    time_end { DateTime.now + 2.hours }
    place { "Sample Place" }
    detail { "Sample Detail" }
    channel

    after(:create) do |event|
      channel_user = create(:channel_user, channel: event.channel)
      create(:channel_event_user, channel_user: channel_user, event: event)
    end
  end
end