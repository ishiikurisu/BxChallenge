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
end
