require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryBot.create(:event)

    sleep 0.1
  end

  describe 'イベント新規作成' do
    context 'イベント作成ができる場合' do
      it 'すべての項目が存在していれば、新規投稿できる' do
        expect(@event).to be_valid
      end
      it 'placeとdetailが存在しなくても、新規投稿できる' do
        @event.place = ''
        @event.detail = ''
        expect(@event).to be_valid
      end
    end
    context 'イベント作成ができない場合' do
      it 'nameが存在しないと作成できない' do
        @event.name = nil
        expect(@event).to_not be_valid
      end

      it 'date_startが存在しないと作成できない' do
        @event.date_start = nil
        expect(@event).to_not be_valid
      end

      it 'date_endが存在しないと作成できない' do
        @event.date_end = nil
        expect(@event).to_not be_valid
      end

      it 'time_startが存在しないと作成できない' do
        @event.time_start = nil
        expect(@event).to_not be_valid
      end

      it 'time_endが存在しないと作成できない' do
        @event.time_end = nil
        expect(@event).to_not be_valid
      end
    end
  end
end
