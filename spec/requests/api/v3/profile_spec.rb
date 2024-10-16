require 'rails_helper'

RSpec.describe 'Api::V3::Profile', type: :request do
  include_context 'jwt authenticated'

  let(:user) { create :user, :volunteer, organization: organization }
  let(:organization) { create :organization }

  let(:profile_response) do
    {
      'created_at' => user.created_at.to_i,
      'name' => user.name,
      'surname' => user.surname,
      'phone' => user.phone,
      'email' => user.email,
      'id' => user.id,
      'score' => user.score,
      'organization' => organization.title,
      'role' => 'volunteer',
      'type' => 'user',
      'updated_at' => user.updated_at.to_i
    }
  end

  describe 'GET /api/v3/profile' do
    it 'returns profile data' do
      get api_v3_profile_path
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to eq(profile_response)
    end
  end

  describe 'POST /api/v3/subscribe' do
    let(:device_token) { '123qwe123qwe' }
    let(:device_platform) { 'android' }

    it 'setups device token data' do
      post api_v3_subscribe_path, params: { device_platform: device_platform, device_token: device_token }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to eq({ 'subscribed' => true })
      expect(user.reload.device_token).to eq(device_token)
      expect(user.reload.device_platform).to eq(device_platform)
    end
  end

  describe 'DELETE /api/v3/unsubscribe' do
    before do
      ("Time" + "cop").constantize.instance_eval do
        def travel(_time)
          self.freeze('1.1.2024')
        end
      end
    end

    let(:user) do
      create :user, :volunteer,
             organization: organization,
             device_token: 'testtoken',
             device_platform: 'ios'
    end

    it 'drops device token data' do
      delete api_v3_unsubscribe_path
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to eq({ 'unsubscribed' => true })
      expect(user.reload.device_token).to be_nil
      expect(user.reload.device_platform).to be_nil
    end
  end
end
