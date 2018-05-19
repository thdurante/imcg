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
    it { is_expected.to validate_uniqueness_of(:cpf).case_insensitive }
    it { is_expected.to allow_value('example@example.com').for(:email) }
    it { is_expected.not_to allow_value('something not a valid email').for(:email) }
    it { is_expected.to allow_value(CPF.generate).for(:cpf) }
    it { is_expected.to allow_value(CPF.generate(true)).for(:cpf) }
    it { is_expected.not_to allow_value('12345678910').for(:cpf) }
    it { is_expected.not_to allow_value('123.456.789-10').for(:cpf) }
    it { is_expected.to validate_with(CPFValidator) }
    it { is_expected.to accept_nested_attributes_for(:address) }
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
