# -*- encoding : utf-8 -*-
require 'rails_helper'

RSpec.describe User do
  it { is_expected.to respond_to :email }
  it { is_expected.to respond_to :token }

  describe '#to_h' do
    let(:user) { build(:user, id: 5, created_at: Time.now) }

    subject { user.to_h }

    it { is_expected.to include(*%i(id email token created)) }
    it { is_expected.to include id: user.id, email: user.email }
  end
end
