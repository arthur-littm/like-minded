Rails.application.routes.draw do

  resources :surveys, except: [:index] do
   resources :questions, only: [:index]
  end
  resources :questions
  devise_for :users
  resources :users, only: [:edit, :update]

  root to: 'surveys#new'
  get '/dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
