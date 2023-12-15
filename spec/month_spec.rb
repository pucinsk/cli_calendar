require_relative '../month'

RSpec.describe Month do
  subject(:month) { described_class.new('September') }

  describe '#month_idx' do
    subject(:month_idx) { month.month_idx }

    it { is_expected.to eq(9) }
  end

  describe '#days' do
    subject(:days) { month.days }

    it { is_expected.to eq(30) }
  end

  describe '#starts_at_day' do
    subject(:starts_at_day) { month.starts_at_day }

    # Thursday
    it { is_expected.to eq(4) }
  end

  describe '#weeks_count' do
    subject(:weeks_count) { month.weeks_count }

    it { is_expected.to eq(5) }
  end



  describe '#days_in_week' do
    subject(:days_in_week) { month.days_in_week }

    let(:result) do
      [
        [nil, nil, nil, nil, 1, 2, 3],
        [4, 5, 6, 7, 8, 9, 10],
        [11, 12, 13, 14, 15, 16, 17],
        [18, 19, 20, 21, 22, 23, 24],
        [25, 26, 27, 28, 29, 30, nil]
      ]
    end

    # checks if first week is calculated correctly
    describe 'first week' do
      subject(:first_week) { month.days_in_week[0] }

      let(:first_week_res) { result[0] }

      it { is_expected.to eq(first_week_res) }
    end

    describe 'last week' do
      subject(:last_week) { month.days_in_week[4] }

      let(:last_week_res) { result[4] }

      it { is_expected.to eq(last_week_res) }
    end

    it { is_expected.to eq(result) }
  end
end
