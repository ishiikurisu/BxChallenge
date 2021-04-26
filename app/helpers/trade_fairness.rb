module TradeFairness
  def TradeFairness.is_list_valid? list
    return list.length > 0 && list.length <= 6
  end

  def TradeFairness.is_trade_fair? a, b
    # verifying if lists are valid
    if not TradeFairness.is_list_valid? a
      return false
    end
    if not TradeFairness.is_list_valid? b
      return false
    end

    # verifying is trade is fair
    is_fair = true
    if a.length != b.length
      is_fair = false
    end
    return is_fair
  end
end
