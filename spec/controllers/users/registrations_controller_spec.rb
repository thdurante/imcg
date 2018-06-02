require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  let!(:person) { create(:person) }

  before do |example|
    @request.env['devise.mapping'] = Devise.mappings[:user]
    subject unless example.metadata[:skip_before_hook]
  end

  describe 'GET #new' do
    subject { get :new }

    it 'returns a success response' do
      is_expected.to be_successful
    end

    it 'renders the :authentication layout' do
      is_expected.to render_template(:authentication)
    end
  end

  describe 'POST #create' do
    subject { post :create, params: params }

    context 'valid params' do
      let(:params) do
        {
          user: attributes_for(:user, email: 'test@test.com', username: 'test-user'),
          person: {
            cpf: person.cpf
          }
        }
      end

      it 'creates a new User', :skip_before_hook do
        expect { subject }.to change(User, :count).by(1)
      end

      it 'assigns a newly created user as @user' do
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it 'assigns person as @person' do
        expect(assigns(:person)).to eq(person)
      end

      it 'redirects to user_session_path' do
        is_expected.to redirect_to user_session_path
      end

      it 'creates a new user with the correct attributes' do
        expect(
          assigns(:user)
        ).to have_attributes(email: 'test@test.com', username: 'test-user', person_id: person.id)
      end

      it 'sets a success flash message' do
        expect(flash[:notice]).to eq(I18n.t('devise.registrations.signed_up_but_unconfirmed'))
      end
    end

    context 'invalid params' do
      let(:params) do
        {
          user: attributes_for(
            :user,
            email: 'not valid email',
            username: nil,
            password: 'something123',
            password_confirmation: 'notMatchingPassword'
          ),
          person: {
            cpf: CPF.generate(true)
          }
        }
      end

      it 'does not create a new User', :skip_before_hook do
        expect { subject }.not_to change(User, :count)
      end

      it 'assigns a newly created but unsaved user as @user' do
        expect(assigns(:user)).to be_a_new(User)
      end

      it 're-renders the :new template' do
        expect(response).to render_template(:new)
      end

      it 'sets an alert flash message' do
        expect(flash[:alert]).to eq(I18n.t('devise.registrations.create.cpf_alert'))
      end
    end
  end
end
