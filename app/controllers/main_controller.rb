class MainController < ActionController::Base
  def index
  end

  def fair inlet
    data = {
      :error => "not implemented",
    }
    render :json => data
  end
end
