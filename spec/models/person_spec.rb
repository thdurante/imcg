require 'rails_helper'

RSpec.describe Person, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_presence_of(:rg) }
    it { is_expected.to validate_presence_of(:member) }
    it { is_expected.to validate_uniqueness_of(:cpf).case_insensitive }
    it { is_expected.to allow_value('example@example.com').for(:email) }
    it { is_expected.not_to allow_value('something not a valid email').for(:email) }
    it { is_expected.to allow_value(CPF.generate).for(:cpf) }
    it { is_expected.to allow_value(CPF.generate(true)).for(:cpf) }
    it { is_expected.not_to allow_value('12345678910').for(:cpf) }
    it { is_expected.not_to allow_value('123.456.789-10').for(:cpf) }
  end
end
