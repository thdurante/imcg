require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  describe 'GET #members_form' do
    subject! { get :members_form }

    it 'renders the authentication layout' do
      is_expected.to render_template(:authentication)
    end

    it 'returns a success response' do
      is_expected.to be_successful
    end

    it 'assigns a new PersonRegistration object as @person_registration' do
      expect(assigns(:person_registration)).to be_a(PersonRegistration)
    end
  end

  describe 'GET #registration' do
    subject! { get :registration, params: params }

    describe 'valid params' do
      let(:params) do
        {
          person_registration: {
            cpf: person_cpf
          }
        }
      end

      context 'new registration' do
        let(:person_cpf) { CPF.generate(true) }

        it 'assigns a new PersonRegistration as @person_registration' do
          person_registration = assigns(:person_registration)

          expect(person_registration).to be_a(PersonRegistration)
          expect(person_registration).to have_attributes(cpf: person_cpf)
        end

        it 'assigns a new Person as @person' do
          expect(assigns(:person)).to be_a(Person)
        end

        it 'the assigned @person is not persisted' do
          expect(assigns(:person)).not_to be_persisted
        end

        it 'the assigned @person has the :cpf attribute set' do
          expect(assigns(:person)).to have_attributes(cpf: CPF.new(person_cpf).stripped)
        end
      end

      context 'already existing registration' do
        let!(:person) { create(:person) }
        let(:person_cpf) { person.cpf }

        it 'assigns a new PersonRegistration as @person_registration' do
          person_registration = assigns(:person_registration)

          expect(person_registration).to be_a(PersonRegistration)
          expect(person_registration).to have_attributes(cpf: person_cpf)
        end

        it 'assigns the already existing Person as @person' do
          expect(assigns(:person)).to eq(person)
        end

        it 'the assigned @person is persisted' do
          expect(assigns(:person)).to be_persisted
        end
      end
    end

    describe 'invalid params' do
      let(:params) do
        {
          person_registration: {
            cpf: '111.111.111-11'
          }
        }
      end

      it 'renders :members_form' do
        is_expected.to render_template(:members_form)
      end
    end
  end

  describe 'POST #create_or_update_registration' do
    subject do
      post :create_or_update_registration, params: { person: params }
    end

    before do |example|
      subject unless example.metadata[:skip_before_hook]
    end

    describe 'valid params' do
      context 'new registration' do
        let(:params) do
          attributes_for(:person).merge!(
            address_attributes: attributes_for(:address),
            phones_attributes: [attributes_for(:phone)]
          )
        end

        it 'creates a new Person', :skip_before_hook do
          expect { subject }.to change(Person, :count).by(1)
        end

        it 'creates a new Phone', :skip_before_hook do
          expect { subject }.to change(Phone, :count).by(1)
        end

        it 'creates a new Address', :skip_before_hook do
          expect { subject }.to change(Address, :count).by(1)
        end

        it 'redirects to root_path' do
          is_expected.to redirect_to(root_path)
        end

        it 'sets a success flash message' do
          expect(flash[:notice]).to eq(I18n.t('people.create_or_update_registration.notice'))
        end
      end

      context 'already existing registration' do
        let(:phone) { build(:phone, number: '555555555') }
        let(:address) { build(:address, street: 'Street') }
        let!(:person) { create(:person, name: 'Jhon', phones: [phone], address: address) }

        let(:params) do
          person.attributes.merge!(
            name: 'William',
            address_attributes: {
              id: person.address.id,
              street: 'Other Street'
            },
            phones_attributes: {
              0 => {
                id: person.phones.first.id,
                number: '777777777'
              }
            }
          )
        end

        it 'changes the person attributes' do
          expect(person.reload.name).to eq('William')
        end

        it 'changes the person.address attributes' do
          expect(person.address.reload.street).to eq('Other Street')
        end

        it 'changes the person.phones attributes' do
          expect(person.reload.phones.first.reload.number).to eq('777777777')
        end

        it 'redirects to root_path' do
          is_expected.to redirect_to(root_path)
        end

        it 'sets a success flash message' do
          expect(flash[:notice]).to eq(I18n.t('people.create_or_update_registration.notice'))
        end
      end
    end

    describe 'invalid params' do
      context 'new registration' do
        let(:params) { attributes_for(:person, cpf: nil) }

        it 'renders :registration' do
          is_expected.to render_template(:registration)
        end
      end

      context 'already existing registration' do
        let!(:person) { create(:person) }
        let(:params) do
          person.attributes.merge(
            name: '',
            address_attributes: {
              id: person.address.id,
              street: ''
            },
            phones_attributes: [
              {
                id: person.phones.first.id,
                _destroy: true
              }
            ]
          )
        end

        it 'renders :registration' do
          is_expected.to render_template(:registration)
        end

        it 'does not change the @person attributes' do
          expect(person.reload).to have_attributes(person.attributes)
        end
      end
    end
  end
end
