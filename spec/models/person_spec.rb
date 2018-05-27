require 'rails_helper'

RSpec.describe Person, type: :model do
  describe 'associations' do
    it { is_expected.to have_one(:address).dependent(:destroy) }
    it { is_expected.to have_many(:phones).dependent(:destroy).inverse_of(:person) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_presence_of(:rg) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_uniqueness_of(:cpf).case_insensitive }
    it { is_expected.to validate_with(CPFValidator) }
    it { is_expected.to accept_nested_attributes_for(:address).allow_destroy(false) }
    it { is_expected.to accept_nested_attributes_for(:phones).allow_destroy(true) }

    it do
      is_expected.to allow_values(
        'example@example.com', '', nil
      ).for(:email)
    end

    it do
      is_expected.not_to allow_values(
        'something not a valid email'
      ).for(:email)
    end

    it do
      is_expected.to allow_values(
        CPF.generate, CPF.generate(true)
      ).for(:cpf)
    end

    it do
      is_expected.not_to allow_values(
        '12345678910', '123.456.789-10'
      ).for(:cpf)
    end

    describe 'custom/complex validations' do
      describe 'at_least_one_phone' do
        let!(:person) { build(:person, phones: []) }
        subject! { person.valid? }

        it { is_expected.to be_falsey }

        it do
          expect(
            person.errors.full_messages
          ).to eq([I18n.t('activerecord.errors.models.person.attributes.base.at_least_one')])
        end
      end
    end
  end

  describe 'callbacks' do
    describe 'before_save' do
      let(:cpf) { CPF.generate(true) }
      let!(:person) { create(:person, cpf: cpf) }
      subject { person.reload }

      it 'saves a stripped :cpf' do
        is_expected.to have_attributes(cpf: CPF.new(cpf).stripped)
      end
    end
  end
end
