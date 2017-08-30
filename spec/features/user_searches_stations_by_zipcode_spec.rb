RSpec.feature "User searches stations by zipcode" do
  scenario "they are redirected to the results page with 10 results" do
    VCR.use_cassette('features/user_searches_by_zipcode') do
      visit root_path
      fill_in "q", with: '80203'
      click_on "Locate"

      expect(current_url).to include('q=80203')
      expect(current_path).to eq('/search')
      expect(page).to have_css(".station", count: 10)
    end
  end
  scenario "they only see electric & propane stations" do
    VCR.use_cassette('features/user_searches_by_zipcode') do
      visit root_path
      fill_in "q", with: '80203'
      click_on "Locate"

      expect(page).to_not have_content("BD")
      expect(page).to_not have_content("E85")
      expect(page).to_not have_content("HY")
      expect(page).to_not have_content("LNG")
    end
  end
  scenario "they see name, address, fuel type, distance and access times for each station" do
    VCR.use_cassette('features/user_searches_by_zipcode') do
      visit root_path
      fill_in "q", with: '80203'
      click_on "Locate"

      expect(page).to have_css(".name", count: 10)
      expect(page).to have_css(".address", count: 10)
      expect(page).to have_css(".fuel_type", count: 10)
      expect(page).to have_css(".access_time", count: 10)
      expect(page).to have_css(".distance", count: 10)
    end
  end
  scenario "the results are sorted by distance and within 6 miles" do
    VCR.use_cassette('features/user_searches_by_zipcode') do

    end
  end
end
