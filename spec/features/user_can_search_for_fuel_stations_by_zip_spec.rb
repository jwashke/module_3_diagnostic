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
      VCR.use_cassette "default search by zip" do
        visit root_path

        fill_in :q, with: "80203"
        click_button "Locate"

        within(".station-66897") do
          expect(page).to have_content("UDR")
          expect(page).to have_content("800 Acoma St Denver CO 80204")
          expect(page).to have_content("0.3117 miles")
          expect(page).to have_content("Access Times: 24 hours daily")
        end
      end
    end
  end
end
