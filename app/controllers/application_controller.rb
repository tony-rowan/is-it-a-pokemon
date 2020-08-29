class ApplicationController < ActionController::Base
  def pokemon
    pokemon = Rails.application.config.pokemon.sample
    render(status: 200, json: pokemon.merge(real: true))
  end
end
