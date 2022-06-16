Rails.application.routes.draw do
  root "questions#show"

  resources :question_responses, only: %i[show create]
end
