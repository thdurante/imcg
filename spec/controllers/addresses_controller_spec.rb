require 'rails_helper'

RSpec.describe AddressesController, type: :controller do
  describe 'GET #cities' do
    subject! { get :cities, params: params }

    context 'with correct state param' do
      let(:params) { { state: 'GO' } }

      it 'returns the correct cities json' do
        expect(response.body).to eq(CS.cities('GO', :br).to_json)
      end
    end

    context 'with incorrect state param' do
      let(:params) { { state: 'something-not-a-state' } }

      it 'returns an empty json array' do
        expect(response.body).to eq([].to_json)
      end
    end

    context 'nil state param' do
      let(:params) { {} }

      it 'returns an empty json array' do
        expect(response.body).to eq([].to_json)
      end
    end
  end
end
