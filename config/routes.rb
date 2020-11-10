Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "questions#index"
  resources :questions
  resources :answers, only: [:show, :create, :destroy]

  resources :questions do
    resources :answers, only: [:create, :destroy]
  end
end
