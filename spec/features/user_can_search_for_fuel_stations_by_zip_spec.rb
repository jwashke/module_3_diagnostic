require "rails_helper"
# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search?zip=80203"
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

RSpec.feature "User can search for fuel stations by zip code" do
  context "default distance field" do
    it "displays the 10 closest stations within 6 miles" do
      visit root_path

      fill_in :q, with: "80203"
      click_button "Locate"

      within(".station-66897") do
        expect(page).to have_content?("UDR")
        expect(page).to have_content?("800 Acoma St Denver CO 80204")
        expect(page).to have_content?("0.31 miles")
        expect(page).to have_content?("Access Times: 24 hours daily")
      end
    end
  end
end

# "access_days_time": "24 hours daily",
#   "cards_accepted": null,
#   "date_last_confirmed": "2016-06-06",
#   "expected_date": null,
#   "fuel_type_code": "ELEC",
#   "id": 66897,
  # "groups_with_access_code": "Public",
  # "open_date": null,
  # "owner_type_code": null,
  # "status_code": "E",
  # "station_name": "UDR",
  # "station_phone": "888-758-4389",
  # "updated_at": "2016-06-06T08:06:43Z",
  # "geocode_status": "GPS",
  # "latitude": 39.7300224,
  # "longitude": -104.9883424,
  # "city": "Denver",
  # "intersection_directions": "816 ACOMA 1; For residents only - 5th Floor",
  # "plus4": null,
  # "state": "CO",
  # "street_address": "800 Acoma St",
  # "zip": "80204",
  # "bd_blends": null,
  # "e85_blender_pump": null,
  # "ev_connector_types": [
  #   "J1772"
  # ],
  # "ev_dc_fast_num": null,
  # "ev_level1_evse_num": null,
  # "ev_level2_evse_num": 2,
  # "ev_network": "ChargePoint Network",
  # "ev_network_web": "http://www.mychargepoint.net/",
  # "ev_other_evse": null,
  # "hy_status_link": null,
  # "lpg_primary": null,
  # "ng_fill_type_code": null,
  # "ng_psi": null,
  # "ng_vehicle_class": null,
  # "ev_network_ids": {
  #   "posts": [
  #     "1:118249"
  #   ]
  # },
  # "distance": 0.3117
