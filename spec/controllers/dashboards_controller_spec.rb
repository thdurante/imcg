require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do
  describe 'GET #index' do
    before(:each) { get :index }

    it 'returns http success' do
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'sets a flash message' do
      expect(flash[:notice]).to eq('Mensagem exemplo de sucesso!')
    end
  end

  describe 'GET #admin' do
    before(:each) { get :admin }

    it 'returns http success' do
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      expect(response).to render_template(:admin)
    end

    it 'sets a flash message' do
      expect(flash[:alert]).to eq('Mensagem exemplo de erro!')
    end
  end
end
