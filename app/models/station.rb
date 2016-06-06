class Station
  def initialize(station)
    @id           = station["id"]
    @name         = station["station_name"]
    @address      = "#{station["street_address"]} #{station["city"]} #{station["state"]} #{station["zip"]}"
    @fuel_type    = station["fuel_type_code"]
    @distance     = station["distance"]
    @access_times = station["access_days_time"]
    byebug
  end

  def self.get_stations(zip_code, distance = 6)
    response = NrelService.new.search_by_zip(zip_code, distance)
    response["fuel_stations"].map do |station|
      Station.new(station)
    end
  end
end
