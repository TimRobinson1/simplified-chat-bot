require 'rails_helper'

RSpec.describe Clearance::UsersController, type: :controller do
  describe 'GET /sign_up' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end
end
