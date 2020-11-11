Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "questions#index"
  resources :questions
  resources :answers, only: [:show, :create, :destroy, :update]

  resources :questions do
    resources :answers, only: [:show, :create, :destroy, :update]
  end
end
