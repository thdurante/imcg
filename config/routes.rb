Rails.application.routes.draw do
  root 'dashboards#index'
  get 'dashboards/admin', to: 'dashboards#admin'
end
