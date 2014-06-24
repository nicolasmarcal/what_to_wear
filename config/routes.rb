WhatToWear::Application.routes.draw do
  namespace :app do
  resources :people do
    match :dashboard, :via => :get
  end

  end
  
  namespace :site do
    resources :home, :only => [:index], :as => :root
  end

  namespace :admin do

  end

  match 'auth/:provider/callback', to: 'app/sessions#create'

  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  get "/" => "site/home#index"
end
