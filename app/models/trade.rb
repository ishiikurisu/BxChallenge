class Trade < ApplicationRecord
  def to_view
    return [
      self.party1.split(","),
      self.party2.split(","),
    ]
  end

  def Trade.save_lists lists
    party1 = lists[0].map{ |p| p.strip }.join(",")
    party2 = lists[1].map{ |p| p.strip }.join(",")
    Trade.create(:party1 => party1, :party2 => party2)
  end
end
