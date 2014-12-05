# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe Image do
  it { is_expected.to respond_to :cached_filepath }
  it { is_expected.to respond_to :dimensions }
  it { is_expected.to respond_to :mime_type }
  it { is_expected.to respond_to :original_filepath }
  it { is_expected.to respond_to :processed_filepath }
  it { is_expected.to respond_to :resolution }
  it { is_expected.to respond_to :signature }
  it { is_expected.to respond_to :size }
  it { is_expected.to respond_to :transformations }
  it { is_expected.to respond_to :user_id }
end
