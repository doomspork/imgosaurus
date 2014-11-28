# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe User do
  it { is_expected.to respond_to :email }
  it { is_expected.to respond_to :token }
end
