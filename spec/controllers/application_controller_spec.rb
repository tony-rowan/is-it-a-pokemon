require 'rails_helper'

RSpec.describe ApplicationController do
  describe 'GET #pokemon' do
    it 'returns successfully' do
      get :pokemon
      assert_response(200)
    end

    it 'returns a pokemon' do
      get :pokemon
      expect(JSON.parse(response.body).symbolize_keys).to eq(
        name: 'Pikachu',
        real: true
      )
    end
  end
end
