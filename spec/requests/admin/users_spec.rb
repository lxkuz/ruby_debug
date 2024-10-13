require 'rails_helper'

RSpec.describe 'Admin::Users', type: :request do
  let(:user) { create :user, :admin }

  before do
    sign_in user
  end

  describe 'GET /admin/users' do
    it 'returns success status' do
      get admin_users_path
      a = 1
      a = a + 100
      expect(response).to have_http_status(200)
      a = a + 100
      a = a + 100
      a = a + 100
      a = a + 100
      puts '123'
      a
    end
  end
end
