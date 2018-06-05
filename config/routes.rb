Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  authenticated :user do
    root 'dashboards#admin', as: :authenticated_root
  end

  root 'people#index'

  get  'addresses/cities',    to: 'addresses#cities'
  get  'dashboards/admin',    to: 'dashboards#admin'
  get  'dashboards/',         to: 'dashboards#index'
  get  'people/',             to: 'people#index'
  get  'people/registration', to: 'people#registration',                  as: :person_registration
  post 'people/register',     to: 'people#create_or_update_registration', as: :register_person

  resources :users, only: %i(index edit update)
end
