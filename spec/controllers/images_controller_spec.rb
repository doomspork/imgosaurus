# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  describe 'POST create' do
    let(:final_image) { 'https://cdn.imgosaurus.com/image.png' }
    let(:user) { create(:user) }

    before { request.env['HTTP_IMGOSAURUS_TOKEN'] = user.token }

    it 'returns http success' do
      mock(Pipeline).process(anything, anything) { final_image }
      post :create, image: 'a remote path', transformations: { 'crop' => '15%' }
      expect(response).to have_http_status(:success)
      expect(json_response).to include 'image' => final_image
    end

    context 'when missing the image' do
      it 'returns http bad request' do
        post :create
        expect(response).to have_http_status(:bad_request)
      end
    end
    
    context 'when token is missing or invalid' do
      before { request.env['HTTP_IMGOSAURUS_TOKEN'] = nil }
      
      it 'returns http unauthorized' do
        post :create, image: 'a remote path', transformations: { 'crop' => '15%' }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

end
