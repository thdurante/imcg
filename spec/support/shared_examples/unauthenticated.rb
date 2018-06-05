RSpec.shared_examples 'shared examples for unauthenticated user' do
  it 'redirects to sign_in_path', :skip_sign_in do
    is_expected.to redirect_to(new_user_session_path)
  end

  it 'sets an alert flash message', :skip_sign_in do
    expect(flash[:alert]).to eq(I18n.t('devise.failure.unauthenticated'))
  end
end
