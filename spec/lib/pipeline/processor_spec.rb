# -*- encoding : utf-8 -*-
require 'rails_helper'

module Pipeline
  RSpec.describe Processor do
    subject { Object.new.extend(Processor) }

    describe '#process' do
      let(:image) { MiniMagick::Image.open("#{fixture_path}/tuu.png") }
      let(:transformations) { { resize: '100x100', format: 'png' } }

      it 'will perform the transformations on the image' do
        mock.proxy(image).resize('100x100')
        mock.proxy(image).format('png')
        subject.process(image, transformations)
      end
    end
  end
end
