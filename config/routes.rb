Rails.application.routes.draw do

  get  '/login',to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users
  end
  root to: 'myprofiles#index' 
  resources :myprofiles do
    delete :delete_image_attachment
  end
  resources :tasks do
    post :confirm, action: :confirm_new, on: :new
    post :import, on: :collection
  end






end
