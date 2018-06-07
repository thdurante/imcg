class PeopleController < ApplicationController
  layout :resolve_layout

  skip_before_action :authenticate_user!, only: %i(members_form registration create_or_update_registration)
  before_action :validate_person_registration, only: :registration
  before_action :set_person_by_cpf, only: %i(registration create_or_update_registration)

  def index
    @people = Person.includes(:user, :phones, :address).all.order(name: :asc).page(params[:page])
  end

  def members_form
    @person_registration = PersonRegistration.new
  end

  def registration; end

  def create_or_update_registration
    @person.assign_attributes(person_params)
    if @person.save
      redirect_to root_path, notice: t('.notice')
    else
      render :registration
    end
  end

  private

  def resolve_layout
    action_name == 'index' ? 'application' : 'authentication'
  end

  def validate_person_registration
    @person_registration = PersonRegistration.new(person_registration_params)
    render :members_form unless @person_registration.valid?
  end

  def set_person_by_cpf
    cpf = @person_registration ? @person_registration.cpf : params[:person].try(:[], :cpf)
    @person = Person.where(cpf: CPF.new(cpf).stripped).first_or_initialize
  end

  def person_registration_params
    params.fetch(:person_registration, {}).permit(:cpf)
  end

  def person_params
    params.require(:person).permit(
      :id, :cpf, :rg, :name, :email, :occupation, :member,
      address_attributes: %i(id street number complement neighborhood city state),
      phones_attributes: %i(id kind number _destroy)
    )
  end
end
