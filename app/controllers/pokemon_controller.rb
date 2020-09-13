class PokemonController < ApplicationController
  def random
    render(status: 200, json: Pokemon.available.sample)
  end

  def answer
    pokemon = Pokemon.available.find { |p| p[:name] == params_pokemon }
    correct =  params_real == pokemon.present?
    response_body = { correct: correct }
    response_body.merge!(pokemon: pokemon) if pokemon
    render(status: 200, json: response_body)
  end

  def params_pokemon
    params.require(:pokemon)
  end

  def params_real
    params.require(:real)
  end
end
