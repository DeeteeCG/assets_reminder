require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_length_of(:password).is_at_least(7).on(:create).with_message('password too short') }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end

  describe 'associations' do
   it { is_expected.to have_many(:items) }
  end

  describe '#search-form' do
    it 'finds item with searched term' do
      a = User.create(first_name: 'aaa', last_name: 'aaa', email: 'aaa@gmail.com', password: '1234567', password_confirmation: '1234567')
      Item.create(item_name: "laptop", deadline: "2019-03-21", user_id: a.id)
      Item.create(item_name: "iphone", deadline: "2019-03-21", user_id: a.id)
      expect(Item.search('laptop').count).to eq 1
    end

    it 'return 0 items if searhed term not found (controller will shows all items)' do
      b = User.create(first_name: 'bbb', last_name: 'bbb', email: 'bbb@gmail.com', password: '1234567', password_confirmation: '1234567')
      Item.create(item_name: "laptop", deadline: "2019-03-21", user_id: b.id)
      Item.create(item_name: "iphone", deadline: "2019-03-21", user_id: b.id)
      expect(Item.search('happy').count).to eq 0
    end


  end

end
