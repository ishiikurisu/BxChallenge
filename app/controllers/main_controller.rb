require "json"

class MainController < ActionController::Base
  def index
    @trades = Trade.order("created_at DESC").limit(5).map{ |x| x.to_view }
  end

  def fair
    lists = JSON.parse(params.as_json["parties"])
    is_fair = PokemonInfo.is_trade_fair? lists[0], lists[1]
    render :json => {
      :error => nil,
      :result => is_fair,
    }
  end

  def save
    render :json => {
      :error  => Trade.save_lists(JSON.parse(params.as_json["parties"])),
    }
  end
end
