require 'rails_helper'

describe User do
  context 'when create a user' do
    subject(:user) { build_stubbed(:user) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:id_document) }
    it { is_expected.to validate_presence_of(:phone) }

    it { is_expected.to have_many(:reservations) }
  end
end
