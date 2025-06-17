require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { build(:product) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(255) }

    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_uniqueness_of(:code).case_insensitive }
    it { is_expected.to validate_length_of(:code).is_at_most(10) }

    it { is_expected.to monetize(:price).with_currency(:eur) }
    it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  end
end
