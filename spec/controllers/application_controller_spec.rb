require 'rails_helper'

RSpec.describe ApplicationController do
  describe 'GET #pokemon' do
    it 'returns successfully' do
      get :pokemon
      assert_response(200)
    end

    it 'returns a random pokemon from the available pokemon in config' do
      Rails.application.config.pokemon = [
        {id: 123, name: 'some pokemon'}
      ]
      get :pokemon
      expect(JSON.parse(response.body).symbolize_keys).to eq(
        id: 123,
        name: 'some pokemon',
        real: true
      )
    end
  end
end
