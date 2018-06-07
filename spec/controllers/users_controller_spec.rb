require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include_context 'authentication context'

  describe 'GET #index' do
    let!(:users_list) { create_list(:user, 3) }

    subject { get :index }

    context 'authenticated user' do
      it 'returns http success' do
        is_expected.to be_successful
      end

      it 'renders the correct template' do
        is_expected.to render_template(:index)
      end

      it 'sets users_list as @users' do
        expect(assigns(:users)).to match_array(users_list << user)
      end
    end

    context 'unauthenticated user' do
      include_examples 'shared examples for unauthenticated user'
    end
  end

  describe 'GET #edit' do
    subject { get :edit, params: { id: user.id } }

    context 'authenticated user' do
      it 'returns http success' do
        is_expected.to be_successful
      end

      it 'renders the correct template' do
        is_expected.to render_template(:edit)
      end

      it 'assigns current_user' do
        expect(controller.current_user).to eq(user)
      end
    end

    context 'unauthenticated user' do
      include_examples 'shared examples for unauthenticated user'
    end
  end

  describe 'PUT #update' do
    let!(:other_user) { create(:user, username: 'other-user', password: 'otherUser123456', approved: false) }

    subject { put :update, params: params }

    describe 'authenticated user' do
      describe 'valid params' do
        context 'request made from index page' do
          let(:headers) { { 'HTTP_REFERER': users_url } }

          let(:params) do
            {
              id: other_user.id,
              user: {
                approved: true
              }
            }
          end

          it 'updates other_user :approved attribute' do
            expect(other_user.reload.approved?).to be_truthy
          end

          it 'redirects to users_path' do
            is_expected.to redirect_to(users_path)
          end

          it 'sets a success flash message' do
            expect(flash[:notice]).to eq(I18n.t('users.update.notice'))
          end
        end

        context 'request made from edit page' do
          let(:headers) { { 'HTTP_REFERER': edit_user_url(other_user) } }

          let(:base_params) do
            {
              id: other_user.id,
              user: {
                username: 'new-username'
              }
            }
          end

          context 'without password params' do
            let(:params) { base_params }

            it 'does not update other_user username' do
              expect(other_user.reload).to have_attributes(username: 'other-user')
            end

            it 'updates current_user username' do
              expect(user.reload).to have_attributes(username: 'new-username')
            end

            it 'redirects to users_path' do
              is_expected.to redirect_to(users_path)
            end

            it 'sets a success flash message' do
              expect(flash[:notice]).to eq(I18n.t('users.update.notice'))
            end
          end

          context 'with password params' do
            let(:params) do
              base_params.deep_merge(user: { password: 'newPassword123', password_confirmation: 'newPassword123' })
            end

            it 'does not update other_user username' do
              expect(other_user.reload).to have_attributes(username: 'other-user')
            end

            it 'does not update other_user password' do
              old_password = other_user.encrypted_password
              expect(other_user.reload).to have_attributes(encrypted_password: old_password)
            end

            it 'updates current_user username' do
              expect(user.reload).to have_attributes(username: 'new-username')
            end

            it 'updates current_user password' do
              old_password = user.encrypted_password
              expect(user.reload).not_to have_attributes(encrypted_password: old_password)
            end

            it 'redirects to users_path' do
              is_expected.to redirect_to(users_path)
            end

            it 'sets a success flash message' do
              expect(flash[:notice]).to eq(I18n.t('users.update.notice'))
            end
          end
        end
      end

      describe 'invalid params' do
        let(:headers) { { 'HTTP_REFERER': edit_user_url(other_user) } }

        let(:params) do
          {
            id: other_user.id,
            user: {
              username: nil,
              password: 'short',
              password_confirmation: 'tooShort'
            }
          }
        end

        it 'does not update other_user' do
          old_password = other_user.encrypted_password
          expect(other_user.reload).to have_attributes(username: 'other-user', encrypted_password: old_password)
        end

        it 'does not update user' do
          old_password = user.encrypted_password
          expect(user.reload).to have_attributes(username: 'user', encrypted_password: old_password)
        end

        it 'assigns current_user with errors' do
          expect(controller.current_user.reload.errors).not_to be_empty
        end

        it 're-renders the :edit template' do
          is_expected.to render_template(:edit)
        end
      end
    end

    describe 'unauthenticated user' do
      let(:params) do
        {
          id: other_user.id,
          user: {
            approved: true
          }
        }
      end

      include_examples 'shared examples for unauthenticated user'
    end
  end
end
