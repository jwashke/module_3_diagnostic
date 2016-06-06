class Station
  def self.get_stations(zip_code, distance = 6)
    NrelService.new.search_by_zip(zip_code, distance)
  end
end
