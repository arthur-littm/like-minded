Rails.application.routes.draw do

  resources :surveys, except: [:index] do
    resources :questions, only: [ :index, :edit, :update, :destroy ] do
      resources :answers, only: [ :show, :new, :create ]
    end
    resources :survey_questions, only: [ :destroy ]
    resources :survey_friends, only: [ :destroy ]
    member do
      get '/answering/:token', to: 'surveys#answering', as: :survey_answer
      get '/preview', to: 'surveys#preview', as: :survey_preview
      patch '/answerupdate', to: 'surveys#answer_update', as: :answer_update
      patch '/update_status', to: 'surveys#update_friends', as: :update_friends
      patch '/update_cover_picture', to: 'surveys#update_cover_picture', as: :update_cover_picture
      patch '/update', to: 'surveys#update_status', as: :update_status
      patch '/reverse_status', to: 'surveys#reverse_status', as: :reverse_status

    end
  end

  resources :questions, except: [ :index, :destroy ]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [ :edit, :update ]
  resources :answers, only: [ :show, :new, :create, :destroy ]

  root to: 'surveys#new'
  get '/dashboard', to: 'pages#dashboard'
  # get '/dashboard/sentsurveys', to 'pages#dashboard#'

  mount Attachinary::Engine => "/attachinary"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
