RSpec.shared_context 'authentication context', shared_context: :metadata do
  let!(:user) { create(:user, username: 'user', approved: true) }
  let(:headers) { {} }

  before(:each) do |example|
    sign_in user unless example.metadata[:skip_sign_in]

    request.headers.merge!(headers)
    subject unless example.metadata[:skip_before_hook]
  end
end
