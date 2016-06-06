class SearchController < ApplicationController
  def index
    # byebug
    Station.get_stations(params[:q], params[:distance])
  end
end
