class Station
  attr_reader :id, :name, :address, :fuel_type, :distance, :access_times

  def initialize(station)
    @id           = station["id"]
    @name         = station["station_name"]
    @address      = "#{station["street_address"]} #{station["city"]} #{station["state"]} #{station["zip"]}"
    @fuel_type    = station["fuel_type_code"]
    @distance     = station["distance"]
    @access_times = station["access_days_time"]
  end

  def self.get_stations(zip_code, distance = 6, offset = 0)
    response = NrelService.new.search_by_zip(zip_code, distance, offset)
    pages = response["total_results"] / 10
    stations = response["fuel_stations"].map do |station|
      Station.new(station)
    end
    [pages, stations]
  end
end
