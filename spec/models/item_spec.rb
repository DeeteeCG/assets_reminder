require 'rails_helper'

RSpec.describe Item, type: :model do
  subject { Item.new(deadline: 10.days.from_now)}
  it { is_expected.to validate_length_of(:item_name).is_at_least(3).with_message('Item name too short') }
  it { is_expected.to validate_presence_of(:item_name) }
  it { is_expected.to validate_presence_of(:deadline) }

  describe 'deadline_should_be_after_today' do
    it {should_not allow_value(1.day.ago).
      for(:deadline)}
  end
end
