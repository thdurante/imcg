crumb :root do
  link 'Home', root_path
end

crumb :dashboard do
  link 'Dashboard', root_path
  parent :root
end

crumb :users do
  link User.model_name.human(count: 2), users_path
  parent :root
end

crumb :user do |user|
  user.persisted? ? link(user.name) : link(I18n.t('general.action.new'))
  parent :users
end

crumb :people do
  link Person.model_name.human(count: 2), people_path
  parent :root
end
