require 'rails_helper'
require 'integration_specs/abstract_flow'

RSpec.describe 'admin reading user flow', :type => :request do
  include AbstractFlow
  let(:user) {{email: 'admin10@admin.admin', password: '1234567890'}}
  let(:sign_up_path) {'/admins/'}
  before do
    (0...BULK_CREATE_SIZE).each { |i| create(:admin, email: "admin#{i}@xxx.xxx") }
    (0...BULK_CREATE_SIZE).each { |i| create(:customer, email: "customer#{i}@xxx.xxx") }
    (0...BULK_CREATE_SIZE).each { |i| create(:agent, creator: Admin.first, email: "agent#{i}@xxx.xxx") }
  end

  it 'can read paged admins' do
    create(:admin, email: user[:email], password: user[:password])
    operation_with_out_sign_up do
      header = response.header
      get '/admins/', params: {page: 1, per_page: BULK_CREATE_SIZE-1}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :ok
      expect(response_json['admins'].size).to eq(BULK_CREATE_SIZE-1)
    end
  end

  it 'can read paged customers' do
    create(:admin, email: user[:email], password: user[:password])
    operation_with_out_sign_up do
      header = response.header
      get '/customers/', params: {page: 1, per_page: BULK_CREATE_SIZE-1}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :ok
      expect(response_json['customers'].size).to eq(BULK_CREATE_SIZE-1)
    end
  end

  it 'can read paged agents' do
    create(:admin, email: user[:email], password: user[:password])
    operation_with_out_sign_up do
      header = response.header
      get '/agents/', params: {page: 1, per_page: BULK_CREATE_SIZE-1}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :ok
      expect(response_json['agents'].size).to eq(BULK_CREATE_SIZE-1)
    end
  end
end