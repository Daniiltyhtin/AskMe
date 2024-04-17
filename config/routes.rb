Rails.application.routes.draw do
  resources :questions do
    resources :answers, expect: %i[new show]
  end

  root 'pages#index'
end
