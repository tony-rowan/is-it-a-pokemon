# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "application#index"

  get :random, to: "pokemon#random"
  post :answer, to: "pokemon#answer"
end
