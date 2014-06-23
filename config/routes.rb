WhatToWear::Application.routes.draw do
  namespace :app do
    
  end
  match 'auth/:provider/callback', to: 'app/sessions#create'

  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
end
