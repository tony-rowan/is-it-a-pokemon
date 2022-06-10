Rails.application.routes.draw do
  root "questions#show"

  resources :responses, only: :create
  resource :answer, only: :show
end
