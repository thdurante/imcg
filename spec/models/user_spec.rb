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

    describe '#active_for_authentication?' do
      let!(:active_user) { create(:user, approved_at: Time.current) }
      let!(:inactive_user) { create(:user, approved_at: nil) }

      it 'returns true for an active user' do
        expect(active_user.active_for_authentication?).to be_truthy
      end

      it 'returns false for an inactive user' do
        expect(inactive_user.active_for_authentication?).to be_falsey
      end
    end

    describe '#inactive_message' do
      let!(:confirmed_not_approved_user) { create(:user, confirmed_at: Time.current, approved_at: nil) }
      let!(:not_confirmed_approved_user) { create(:user, confirmed_at: nil, approved_at: Time.current) }

      it 'returns the proper message for confirmed not approved user' do
        expect(confirmed_not_approved_user.inactive_message).to eq(:not_approved)
      end

      it 'returns the proper message for not confirmed approved user' do
        expect(not_confirmed_approved_user.inactive_message).to eq(:unconfirmed)
      end
    end
  end
end
