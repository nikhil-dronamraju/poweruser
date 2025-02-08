require 'rails_helper'

RSpec.describe "DailyTasks", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/daily_tasks/index"
      expect(response).to have_http_status(:success)
    end
  end
end
