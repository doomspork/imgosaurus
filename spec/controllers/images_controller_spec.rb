# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  describe 'POST create' do
    let(:final_image) { 'https://cdn.imgosaurus.com/image.png' }

    it 'returns http success' do
      mock(ImageProcessor).process(anything, anything) { final_image }
      post :create, image: 'a remote path', transformations: { 'crop' => '15%' }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to include 'image' => final_image
    end

    context 'when missing the image' do
      it 'returns http bad request' do
        post :create
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

end
