require 'rails_helper'

RSpec.describe Phone, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:person).inverse_of(:phones) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:person) }
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:kind) }
    it { is_expected.to validate_inclusion_of(:kind).in_array(PhoneKind.names) }
    it { is_expected.to validate_uniqueness_of(:number).scoped_to(:person_id) }
  end
end
