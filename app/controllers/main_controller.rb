require "json"

class MainController < ActionController::Base
  def index
  end

  def fair
    lists = JSON.parse(params.as_json["parties"])
    is_fair = PokemonInfo.is_trade_fair? lists[0], lists[1]
    data = {
      :error => nil,
      :result => is_fair,
    }
    render :json => data
  end
end
