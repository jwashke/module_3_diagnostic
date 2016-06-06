class NrelService
  def initialize
    @conn = Faraday.new(url: "developer.nrel.gov/api/alt-fuel-stations/v1")
  end

  def search_by_zip(zip_code, distance)
    
  end
end
