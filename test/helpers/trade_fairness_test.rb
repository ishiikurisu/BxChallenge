require "test_helper"

class TestTradeFairness < ActiveSupport::TestCase
  test "verify if pokémon lists are valid" do
    scenarios = [
      [[], false],
      [
        ["mimikyu"],
        true
      ],
    ]
    scenarios.each do |list, expected_result|
      obtained_result = TradeFairness.is_list_valid? list
      assert obtained_result == expected_result
    end
  end

  test "verify if trade is fair" do
    scenarios = [
      [ # scenario 1: two invalid lists
        [],
        [],
        false
      ],
      [ # scenario 2: one invalid list
        [],
        ["mimikyu"],
        false
      ],
      [ # scenario 3: trading the same pokémon
        ["mimikyu"],
        ["mimikyu"],
        true
      ],
      # TODO test more scenarios
    ]

    scenarios.each do |first_list, second_list, expected_result|
      obtained_result = TradeFairness.is_trade_fair? first_list, second_list
      assert obtained_result == expected_result
    end
  end

  test "verify if base experience is correct" do
    scenarios = [
      ["honey the cat", nil], # corner case 1: invalid mon
      [778, 167], # corner case 2: get mon from their id instead of their name
      ["calyrex", 250], # corner case 3: get one of the newest mons
      ["raichu", 218], # regular case 1: get common mon from the old times
      ["melmetal", 270], # regular case 2: get common mon from the new times
    ]
    scenarios.each do |pokemon, expected_result|
      obtained_result = TradeFairness.get_base_experience pokemon
      assert obtained_result == expected_result
    end
  end
end
