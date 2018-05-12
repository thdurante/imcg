crumb :root do
  link 'Home', root_path
end

crumb :dashboard do
  link 'Dashboard', root_path
  parent :root
end
