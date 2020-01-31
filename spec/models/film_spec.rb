require 'rails_helper'

describe Film do
  context 'when create a film' do
    subject(:film) { build_stubbed(:film) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:url_image) }
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:final_date) }

    it { is_expected.to have_many(:reservations) }
  end
end
