require "rails_helper"

RSpec.describe "Users API", type: :request do
  let!(:users) { create_list(:user, 3) }
  let(:user_id) { users.first.id }

  describe "GET /users" do
    it "returns all users" do
      get "/users"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe "GET /users/:id" do
    it "returns a user by ID" do
      get "/users/#{user_id}"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["id"]).to eq(user_id)
    end
  end

  describe "POST /users" do
    let(:valid_attributes) { { name: "New User", email: "newuser@example.com" } }

    it "creates a user" do
      expect {
        post "/users", params: { user: valid_attributes }
      }.to change(User, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end
end