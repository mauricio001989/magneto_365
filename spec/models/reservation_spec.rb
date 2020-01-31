require 'rails_helper'

describe Reservation do
  context 'when create a reservation' do
    subject(:reservation) { build_stubbed(:reservation) }

    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:film) }
  end
end
