class NrelService
  def initialize
    @conn = Faraday.new(url: "http://developer.nrel.gov/api/alt-fuel-stations/v1")
  end

  def search_by_zip(zip_code, distance)
    parse_json(search_nearest(zip_code, distance))
  end

  def search_nearest(zip_code, distance)
    @conn.get 'nearest.json', {
      location:  zip_code,
      fuel_type: "LPG,ELEC",
      api_key:   ENV['NREL_API_KEY'],
      limit:     "10",
      radius:    distance 
    }
  end

  def parse_json(response)
    JSON.parse(response.body)
  end
end
