Rails.application.routes.draw do

  resources :surveys, except: [:index] do
   resources :questions, only: [:index] do
    resources :answers, only: [:show, :new, :create]
  end
   resources :survey_questions, only: [:destroy]
   member do
    get '/answering', to: 'surveys#answering', as: :survey_answer
    patch '/update', to: 'surveys#update_responders', as: :update_responders
    patch '/answerupdate', to: 'surveys#answer_update', as: :answer_update
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
