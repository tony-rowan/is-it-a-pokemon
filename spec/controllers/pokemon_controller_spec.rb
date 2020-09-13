require 'rails_helper'

RSpec.describe PokemonController do
  module Pokemon
    def self.available
      [
        { id: 25, name: 'pikachu' }
      ]
    end
  end

  describe 'GET #random' do
    it 'returns successfully' do
      get :random
      assert_response(200)
    end

    it 'returns a pokemon from the available pokemon' do
      get :random
      expect(JSON.parse(response.body).deep_symbolize_keys).to eq(
        id: 25,
        name: 'pikachu',
      )
    end
  end

  describe '#POST answer' do
    let(:params) { { pokemon: pokemon, real: answer } }

    before do
      post :answer, params: params
    end

    context 'when the pokemon is not given' do
      let(:pokemon) { nil }
      let(:answer) { true }

      it 'returns a bad request' do
        assert_response(400)
      end
    end

    context 'when the pokemon is not given' do
      let(:pokemon) { 'pikachu' }
      let(:answer) { nil }

      it 'returns a bad request' do
        assert_response(400)
      end
    end

    context 'when the pokemon is real' do
      let(:pokemon) { 'pikachu' }

      context 'when the user is correct' do
        let(:answer) { true }

        it 'returns successfully' do
          assert_response(200)
        end

        it 'return that they are correct' do
          expect(JSON.parse(response.body).deep_symbolize_keys).to include(
            correct: true
          )
        end

        it 'returns the pokemon' do
          expect(JSON.parse(response.body).deep_symbolize_keys).to include(
            pokemon: {
              name: 'pikachu',
              id: 25
            }
          )
        end
      end

      context 'when the user is wrong' do
        let(:answer) { false }

        it 'returns successfully' do
          assert_response(200)
        end

        it 'return that they are wrong' do
          expect(JSON.parse(response.body).deep_symbolize_keys).to include(
            correct: false
          )
        end

        it 'returns the pokemon' do
          expect(JSON.parse(response.body).deep_symbolize_keys).to include(
            pokemon: {
              name: 'pikachu',
              id: 25
            }
          )
        end
      end
    end

    context 'when the pokemon is not real' do
      let(:pokemon) { 'realy not a pokemon' }

      context 'when the user is correct' do
        let(:answer) { false }

        it 'returns successfully' do
          assert_response(200)
        end

        it 'return that they are correct' do
          expect(JSON.parse(response.body).deep_symbolize_keys).to include(
            correct: true
          )
        end
      end

      context 'when the user is wrong' do
        let(:answer) { true }

        it 'returns successfully' do
          assert_response(200)
        end

        it 'return that they are wrong' do
          expect(JSON.parse(response.body).deep_symbolize_keys).to include(
            correct: false
          )
        end
      end
    end
  end
end
