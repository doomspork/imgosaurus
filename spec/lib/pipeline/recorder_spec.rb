# -*- encoding : utf-8 -*-
require 'rails_helper'

module Pipeline
  RSpec.describe Recorder do
    subject { Object.new.extend(Recorder) }

    describe '#record' do
      let(:image) { MiniMagick::Image.open("#{fixture_path}/tuu.png") }
      let(:original_path) { 'http://example.net/test.png' }
      let(:transformations) { { 'resize' => '100x100', 'format' => 'png' } }
      let(:user_id) { 1 }
      let(:request) do
        {
          image:           original_path,
          transformations: transformations
        }
      end

      it 'will save image attributes to database' do
        subject.record(image, request, user_id)
        expect(Image.count).to eq 1

        first = Image.first
        expect(first.dimensions).to eq [195, 329]
        expect(first.mime_type).to eq 'image/png'
        expect(first.original_filepath).to eq original_path
        expect(first.resolution).to_not be_nil
        expect(first.signature).to_not be_nil
        expect(first.size).to be_a Numeric
        expect(first.transformations).to eq transformations
        expect(first.user_id).to eq user_id
      end
    end
  end
end
