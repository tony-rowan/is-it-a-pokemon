class RemoveDefaultFromPokemonsNumber < ActiveRecord::Migration[7.0]
  def change
    change_column_default :pokemons, :number, nil
  end
end
