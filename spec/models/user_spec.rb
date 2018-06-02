require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:person) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:person) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username).case_insensitive }
  end

  describe 'delegations' do
    %i(name cpf rg phones address member occupation).each do |method|
      it { is_expected.to delegate_method(method).to(:person) }
    end
  end

  describe 'instance methods' do
    describe '#approved?' do
      let!(:approved_user) { create(:user) }
      let!(:not_approved_user) { create(:user, approved_at: nil) }

      it 'returns true when user is approved' do
        expect(approved_user.approved?).to be_truthy
      end

      it 'returns false when user is not approved' do
        expect(not_approved_user.approved?).to be_falsey
      end
    end
  end
end
