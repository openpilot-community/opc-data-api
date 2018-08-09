require 'rails_helper'

RSpec.describe "users#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/users/#{user.id}"
  end

  describe 'basic destroy' do
    let!(:user) { create(:user) }

    it 'updates the resource' do
      expect {
        make_request
      }.to change { User.count }.by(-1)

      expect(response.status).to eq(200)
      expect(json).to eq('meta' => {})
    end
  end
end
