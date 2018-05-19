Rails.application.routes.draw do
  root 'dashboards#index'
  get 'dashboards/admin', to: 'dashboards#admin'
  get 'addresses/cities', to: 'addresses#cities'
end
