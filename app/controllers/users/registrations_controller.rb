module Users
  class RegistrationsController < Devise::RegistrationsController
    layout 'authentication'

    before_action :configure_sign_up_params, only: %i(create)
    before_action :check_person_existence, only: %i(create)

    protected

    def build_resource(hash = {})
      super(hash)
      resource.person = @person
    end

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i(username))
    end

    def check_person_existence
      @person = Person.find_by(cpf: CPF.new(params[:person].try(:[], :cpf)).try(:stripped))
      flash.now[:alert] = t('devise.registrations.create.cpf_alert') unless @person
    end

    def after_inactive_sign_up_path_for(_resource)
      user_session_path
    end
  end
end
