Rails.application.routes.draw do
  get 'survey/index'

  get 'survey/show'

  get 'survey/new'

  get 'survey/create'

  get 'survey/edit'

  get 'survey/update'

  get 'survey/destroy'

  get 'question/index'

  get 'question/new'

  get 'question/create'

  get 'question/destroy'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
