class ApplicationController < ActionController::Base
  def pokemon
    render(status: 200, json: { name: 'Pikachu', real: true })
  end
end
