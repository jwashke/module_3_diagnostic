require 'rails_helper'

RSpec.describe Station, type: :model do
  describe ".get_stations" do
    it "returns an array of 10 station objects" do
      VCR.use_cassette "Station.get_stations model test" do
        pages, stations = Station.get_stations("80203")

        expect(stations.count).to eq(10)
        expect(stations.first.class).to eq(Station)
        expect(pages).to eq(6)
      end
    end
  end
end
