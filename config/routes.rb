Rails.application.routes.draw do
  root to: 'application#index'

  get :pokemon, to: 'application#pokemon'
end
