Rails.application.routes.draw do
  resources :question, only: %i[index new edit create]
  #resources :question, only: [:index, :new, :edit, :create]
  #get '/questions', to: 'questions#index'

  #get '/questions/new', to: 'questions#new'

  #get '/questions/:id/edit', to: 'questions#edit'

  #post '/questions', to: 'questions#create'

  root 'pages#index'
end
