Rails.application.routes.draw do

  get 'answers/show'

  get 'answers/new'

  get 'answers/create'

  resources :surveys, except: [:index] do
   resources :questions, only: [:index]
   resources :survey_questions, only: [:destroy]
   member do
    get '/answering', to: 'surveys#answering', as: :survey_answer
   end
  end
  resources :questions
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:edit, :update]
  resources :answers, only: [:show, :new, :create]

  root to: 'surveys#new'
  get '/dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
