require 'poke-api-v2'

module PokemonInfo
  def PokemonInfo.get_pokemon pokemon
    species = PokeApi.get(pokemon_species: pokemon)
    return PokeApi.get(pokemon: species.varieties[0].pokemon.name)
  end

  def PokemonInfo.get_base_experience pokemon
    begin
      PokemonInfo.get_pokemon(pokemon).base_experience
    rescue
      nil
    end
  end

  def PokemonInfo.is_list_valid? list
    correct_length = list.length > 0 && list.length <= 6
    pokemon_exist = list.map{ |p| p != nil }.reduce(true){ |s,p| s && p }
    correct_length and pokemon_exist
  end

  def PokemonInfo.base_experience_of_list list
    list.map{ |p| PokemonInfo.get_base_experience p }.reduce(0){ |s,p| p==nil ? nil : s+p }
  end

  def PokemonInfo.is_trade_fair? a, b
    be_a = PokemonInfo.base_experience_of_list a
    be_b = PokemonInfo.base_experience_of_list b
    is_a_valid = PokemonInfo.is_list_valid? a
    is_b_valid = PokemonInfo.is_list_valid? b

    if be_a == nil || be_b == nil || !is_a_valid || !is_b_valid
      return false
    end

    if 0.1*(be_a + be_b) > (be_a - be_b).abs
      return true
    end

    return false
  end
end
