require 'rails_helper'

RSpec.describe "Channels", type: :request do
  describe "GET /channels" do

    before do
      @user = FactoryBot.create(:user)
      sign_in @user
    end
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
      get root_path
      puts "Response location: #{response.location}"
      expect(response.status).to eq 200
    end
  end
end
