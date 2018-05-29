Rails.application.routes.draw do
  root 'people#index'

  get  'addresses/cities',    to: 'addresses#cities'
  get  'dashboards/admin',    to: 'dashboards#admin'
  get  'dashboards/',         to: 'dashboards#index'
  get  'people/registration', to: 'people#registration',                  as: :person_registration
  post 'people/register',     to: 'people#create_or_update_registration', as: :register_person
end
