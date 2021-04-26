require "test_helper"

class TestPokemonInfo < ActiveSupport::TestCase
  test "verify if pokémon lists are valid" do
    scenarios = [
      [[], false],
      [
        ["mimikyu"],
        true
      ],
    ]
    scenarios.each do |list, expected_result|
      obtained_result = PokemonInfo.is_list_valid? list
      assert obtained_result == expected_result
    end
  end

  test "verify if trade is fair" do
    scenarios = [
      [ # two invalid lists
        [],
        [],
        false
      ],
      [ # one invalid list
        [],
        ["mimikyu"],
        false
      ],
      [ # trading the same pokémon
        ["mimikyu"],
        ["mimikyu"],
        true
      ],
      [ # trading different pokémon so trade is valid
        ["mimikyu", "raichu", "bidoof", "bidoof", "bidoof"],
        ["melmetal", "calyrex"],
        true
      ],
      [ # trading different pokémon so trade is invalid
        ["bidoof"],
        ["mewtwo", "giratina", "calyrex"],
        false
      ],
    ]

    scenarios.each do |first_list, second_list, expected_result|
      obtained_result = PokemonInfo.is_trade_fair? first_list, second_list
      assert obtained_result == expected_result
    end
  end

  test "verify if base experience is correct" do
    scenarios = [
      ["honey the cat", nil], # invalid mon
      [778, 167], # get mon from their id instead of their name
      ["calyrex", 250], # get one of the newest mons
      ["raichu", 218], # get common mon from the old times
      ["melmetal", 270], # get common mon from the new times
    ]
    scenarios.each do |pokemon, expected_result|
      obtained_result = PokemonInfo.get_base_experience pokemon
      assert obtained_result == expected_result
    end
  end
end
