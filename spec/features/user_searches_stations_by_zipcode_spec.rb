RSpec.feature "User searches stations by zipcode" do
  scenario "they are redirected to the results page with 10 results" do
    VCR.use_cassette('spec/cassettes/user_searches_by_zipcode') do
      visit root_path
      fill_in "q", with: '80203'
      click_on "Locate"

      expect(current_url).to include('q=80203')
      expect(current_path).to eq('/search')
      expect(page).to have_css(".station", count: 10)
    end
  end
  scenario "they only see electric & propane stations" do
    VCR.use_cassette('spec/cassettes/user_searches_by_zipcode') do

    end
  end
  scenario "they see name, address, fuel type, distance and access times for each station" do
    VCR.use_cassette('spec/cassettes/user_searches_by_zipcode') do

    end
  end
  scenario "the results are sorted by distance" do
    VCR.use_cassette('spec/cassettes/user_searches_by_zipcode') do

    end
  end
end
