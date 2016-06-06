class SearchController < ApplicationController
  def index
    @stations = Station.get_stations(params[:q], params[:distance])
  end
end
