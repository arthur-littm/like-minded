Rails.application.routes.draw do

  resources :surveys, except: [:index] do
   resources :questions, only: [:index]
  end
  resources :questions

  devise_for :users

  root to: 'surveys#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
