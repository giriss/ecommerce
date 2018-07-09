# frozen_string_literal: true

require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability do
  subject(:ability) { described_class.new(user) }

  let(:user) { nil }

  context 'when normal user' do
    let(:user) { create :user }
    let(:another_user) { create :user }

    it { is_expected.to be_able_to :manage, user.addresses.new }
    it { is_expected.to be_able_to %i[read update destroy], user }
    it { is_expected.not_to be_able_to :manage, another_user.addresses.new }
    it { is_expected.not_to be_able_to %i[read update destroy], another_user }
  end

  context 'when guest' do
    it { is_expected.to be_able_to :create, User.new }
  end
end