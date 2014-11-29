# -*- encoding : utf-8 -*-
require 'rails_helper'

module Users
  RSpec.describe SessionsController, type: :controller do
    let(:warden) { OpenStruct.new }
    let(:user) { create(:user) }

    describe 'POST create' do
      before do
        @request.env['warden'] = warden
        @request.env['devise.mapping'] = Devise.mappings[:user]
        stub(warden).authenticate?(anything, anything) { false }
        stub(warden).user { user }
      end

      context 'when already logged in' do
        before do
          @request.env['warden'] = warden
          @request.env['devise.mapping'] = Devise.mappings[:user]
          stub(warden).authenticate?(anything) { true }
        end

        it 'returns http success' do
          post :create, email: user.email, password: user.password
          expect(response).to have_http_status(:success)
          expect(json_response).to include(*%w(email token))
        end
      end

      context 'when not logged in' do
        it 'returns http success' do
          post :create, email: user.email, password: user.password
          expect(response).to have_http_status(:success)
          expect(json_response).to include(*%w(email token))
        end
      end

      context 'unsuccessful requests' do
        context 'with missing fields' do
          it 'resturns http bad request' do
            post :create, email: user.email
            expect(response).to have_http_status(:bad_request)
          end
        end

        context 'with missing account' do
          it 'resturns http gone' do
            post :create, email: 'not@example.com', password: user.password
            expect(response).to have_http_status(:gone)
          end
        end

        context 'with incorrect password' do
          it 'returns https unauthorized' do
            post :create, email: user.email, password: 'a bad password'
            expect(response).to have_http_status(:unauthorized)
          end
        end
      end
    end

    describe 'DELETE destroy' do
      before do
        @request.env['warden'] = warden
        @request.env['devise.mapping'] = Devise.mappings[:user]
        stub(warden).user { user }
        stub(warden).logout { true }
        stub(warden).clear_strategies_cache!
      end

      it 'returns http success' do
        delete :destroy
        expect(response).to have_http_status(:success)
      end
    end
  end
end
