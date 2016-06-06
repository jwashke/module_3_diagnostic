class SearchController < ApplicationController
  def index
    @pages, @stations = Station.get_stations(
      params[:q],
      params[:r],
      params[:offset]
    )
  end
end
